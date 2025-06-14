// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-

#define USE_UNORDERED_MAP true   // set to true for unordered_map; comment out to use plain stl map.
#define STRICT_R_HEADERS
#include <Rcpp.h>
#include <cmath>

#include <string.h>
#include <iostream>
#include <unordered_map>
#include <vector>
#include <deque>
#include <utility>
#include <iterator>


using namespace Rcpp; 
using std::map;
using std::string;

typedef map <string, signed int> term; // A 'term' object is a map from string objects to integers; thus a^2 b^3 is 'a' -> 2, 'b' -> 3
typedef map <term, double> mvp;       // An 'mvp' object (MultiVariatePolynomial) is a map from a term object to a double.
typedef map <string, double> subs;   // A 'subs' object is a map from a string object to a real value, used in variable substitutions; thus a=1.1, b=1.2 is the map {'a' -> 1.1, 'b' -> 2.2}

typedef map <signed int, mvp> series;  // used for Taylor series

const mvp ONE = {{{}, 1.0}};

mvp zero_coefficient_remover(const mvp &X){
    mvp out;
    std::copy_if(X.begin(), X.end(), std::inserter(out, out.end()),
                 [](const auto& pair) { return pair.second != 0; });
    return out;
}

term zero_power_remover(const term &t){
    term out;
    std::copy_if(t.begin(), t.end(), std::inserter(out, out.end()),
                 [](const auto& pair) { return pair.second != 0; });
    return out;
}
    
List retval(const mvp &X){   // takes a mvp object and returns a mpoly-type list suitable for return to R
    unsigned int i,j;
    mvp::const_iterator it;
    term::const_iterator ic;
    
    const unsigned int n=X.size();
    List namesList(n), powerList(n);
    NumericVector coeff_vec(n);

    for(it = X.begin(), i=0 ; it != X.end() ; ++it, i++){
        const term oneterm = it->first; // oneterm is a 'term' object, a map from strings to integers
        const unsigned int r = oneterm.size(); // 'r' is the number of variables in oneterm; thus 5x^2*y*z^6 has r=3
        
        CharacterVector names(r); 
        IntegerVector powers(r);

        for(ic = oneterm.begin(), j=0 ; ic != oneterm.end() ; ++ic, ++j){
            names[j] = (string) ic->first;
            powers[j] = (int) ic->second;
        }
        
        namesList[i] = names;
        powerList[i] = powers;
        coeff_vec[i] = (double) it->second;
    }  // 'it' loop closes


    return List::create(Named("names") = namesList,
                        Named("power") = powerList,
                        Named("coeffs") = coeff_vec
                        );
}
    
mvp prepare(const List allnames, const List allpowers, const NumericVector coefficients){  // the entry of each element is the coefficient.
    mvp out;
    term oneterm;
    const unsigned int n=allnames.size();  // n = number of terms (each term has one coefficient)

    for(unsigned int i=0 ; i<n ; i++){  // need to use int i because we are iterating through a list
        unsigned int j; // scope of j should extend beyond the for(j) loop but not the i loop
        const SEXP jj = allnames[i]; 
        const Rcpp::CharacterVector names(jj);

        const SEXP kk = allpowers[i]; 
        const Rcpp::IntegerVector powers(kk);

        const unsigned int r=names.size();
             
        // first make a term:
        oneterm.clear();
        for(j=0; j<r; j++){ 
            oneterm[(string) names[j]] += powers[j];  // NB "+=", not "=" because repeated variable names' powers should add [eg x^2*y*x = x^3*y]
        }
       
        // now clear out any variable with a zero power:
        oneterm = zero_power_remover(oneterm);

        // now map the term to its coefficient: 
        if(coefficients[i] != 0){ // only consider terms with a nonzero coefficient
            out[oneterm]  += coefficients[i];
        }
    } // i loop closes

    // now clear out any term with zero coefficient:
    return zero_coefficient_remover(out);
}

mvp product(const mvp &X1, const mvp &X2){
    mvp out;
    
    for(const auto& [t1, c1] : X1){
        for(const auto& [t2, c2] : X2){
            term t1new = t1;
            for(const auto& [symbol, power] : t2){
                t1new[symbol] += power;  // add the powers of the variables in the two terms
            }
            t1new = zero_power_remover(t1new);
            out[t1new] += c1*c2;  
        }
    }
    return zero_coefficient_remover(out);
}

mvp sum(const mvp &X1, const mvp &X2){
    mvp out=X1;
    
    for(const auto& [term, coef] : X2){
        out[term] += coef;
    }
    return zero_coefficient_remover(out);
}

mvp power_int(const mvp &X, signed int n){

    if(n <  0) {throw std::range_error("power cannot be < 0"); }
    if(n == 0) {return ONE; }
    if(n == 1) {return X; }

    mvp out = ONE; 
    mvp base = X;  

    while (n > 1) {
        if (n % 2 == 1) { 
            out = product(out, base);
        }
        n /= 2;
        if (n > 0) {
            base = product(base, base);
        }
    }
    return product(out, base);
}

mvp deriv(const mvp &X, const string &v){// differentiation: dX/dv, 'v' a single variable
    mvp out;

    for(mvp::const_iterator it=X.begin() ; it != X.end() ; ++it){
        term t = it->first;
        if(t.find(v) == t.end()) continue;
        const signed int power = t[v];       
        t[v]--; // power reduces by one (maybe to zero...)
        t = zero_power_remover(t); // (...which is why we call zpr())
        out[t] = (it->second)* power ;  // coefficient multiplies by power
    }
    return zero_coefficient_remover(out); // eliminates terms with no v
}

mvp taylor_onevar(const mvp &X, const string &v, const signed int &n){
    if(n < 0){throw std::range_error("power cannot be <0");} 
    mvp out = X;
    for(const auto& [xt, _] : X){
        if(xt.find(v) != xt.end()){ 
            if(xt.at(v) > n){
                out.erase(xt) ;
            }
        }
    }
    return out;
}

mvp taylor_onepower_onevar(const mvp &X, const string &v, const signed int &n){
    mvp jj, out;
    if(n == 0){  // n=0 means we seek terms with no symbol v in them
        for(const auto& [xt, coef] : X){
            jj.clear();
            if(xt.find(v) == xt.end()){ // if symbol v *not* present in xt, then:
                jj[xt] = coef;          // (1) populate mvp jj with a single pair
                out = sum(out, jj);     // (2) add this to out
            } // else do nothing
        } // X iteration closes
    } else { //  now n != 0, we seek terms with v^n
        for(const auto& [xt, coef] : X){
            jj.clear();
            if(xt.find(v) != xt.end()){  // if there *is* symbol v in term...
                if(xt.at(v) == n){       // ...and if its power equals n, then:
                    term xn = xt;        // (1) create a new term,
                    xn.erase(v);         // (2) remove v from the new term, 
                    jj[xn] = coef;       // (3) populate jj with a single key-value pair
                    out = sum(out, jj);  // (4) add jj to out.
                }
            }
        }
    } 
    return out;
}

mvp taylor_allvars(const mvp &X, const signed int &n){  // truncated Taylor series
    if(n < 0){throw std::range_error("power cannot be <0");} 
    mvp out = X;
    for(const auto& [xt, coef] : X){
      signed int totalpower = 0;
      for(const auto& [_, power] : xt){
          totalpower += power;
      }
      if(totalpower > n){ out.erase(xt); }
    }
    return out;
}
    
// [[Rcpp::export]]
List mvp_taylor_onevar(
              const List &allnames, const List &allpowers, const NumericVector &coefficients,
              const CharacterVector &v,
              const NumericVector   &n
              ){
    return retval(taylor_onevar(prepare(allnames,allpowers,coefficients), (string) v[0], n[0]));
}

// [[Rcpp::export]]
List mvp_taylor_onepower_onevar(
              const List &allnames, const List &allpowers, const NumericVector &coefficients,
              const CharacterVector &v,
              const NumericVector   &n
              ){
    return retval(taylor_onepower_onevar(prepare(allnames,allpowers,coefficients), (string) v[0], n[0]));
}

// [[Rcpp::export]]
List mvp_taylor_allvars(
              const List &allnames, const List &allpowers, const NumericVector &coefficients,
              const NumericVector &n
              ){
    return retval(taylor_allvars(prepare(allnames,allpowers,coefficients), n[0]));
}

// [[Rcpp::export]]
List simplify(const List &allnames, const List &allpowers, const NumericVector &coefficients){
    return retval(prepare(allnames,allpowers,coefficients));
}

// [[Rcpp::export]]
List mvp_prod(
              const List &allnames1, const List &allpowers1, const NumericVector &coefficients1,
              const List &allnames2, const List &allpowers2, const NumericVector &coefficients2
              ){

    return retval(
                  product(
                          prepare(allnames1,allpowers1,coefficients1),
                          prepare(allnames2,allpowers2,coefficients2)
                          )
                  );
}

// [[Rcpp::export]]
List mvp_add(
              const List &allnames1, const List &allpowers1, const NumericVector &coefficients1,
              const List &allnames2, const List &allpowers2, const NumericVector &coefficients2
              ){

    return retval(
                  sum(
                      prepare(allnames1,allpowers1,coefficients1),
                      prepare(allnames2,allpowers2,coefficients2)
                      )
                  );
}

// [[Rcpp::export]]
List mvp_power(
              const List &allnames, const List &allpowers, const NumericVector &coefficients,
              const NumericVector &n
              ){
    return retval(power_int(prepare(allnames,allpowers,coefficients), n[0]));
}

// [[Rcpp::export]]
List mvp_deriv(
              const List &allnames, const List &allpowers, const NumericVector &coefficients,
              const CharacterVector &v    // v a vector of symbols to be differentiated WR to.
               ){

    mvp X = prepare(allnames, allpowers, coefficients);
    mvp out = std::accumulate(v.begin(), v.end(), X, 
                              [](mvp acc, const auto& var) { return deriv(acc, std::string(var)); });
    return retval(out);
}

// [[Rcpp::export]]
List mvp_substitute(
              const List &allnames, const List &allpowers, const NumericVector &coefficients,
              const CharacterVector &v, const NumericVector &values
    ){
    mvp X = prepare(allnames, allpowers, coefficients);
    subs s;  // "subs" is a substitution object, e.g. {x -> 3, y -> 4, zzd -> 10.1}
    const unsigned int n=v.size();

    for(unsigned int i=0 ; i<n ; i++){
      s[(string) v[i]] = values[i];
    }

    subs::const_iterator i;
    mvp::const_iterator j;
    term::iterator it;

    mvp Xnew;    
    for(const auto& [symbol, value ] : s){       // Iterate through the substitution object s; e.g. {x=1.1, b=5.5};  i->first = "x" and  i->second = 1.1
        Xnew.clear();                            // Empty mvp object to take substituted terms
        for(j = X.begin() ; j != X.end() ; ++j){ // Iterate through  X; e.g. j->first = {"x" -> 3, "ab" -> 5} [that is, x^3*ab^5] and j->second=2.2 [that is, 2.2 x^3*ab^5]
            term t = j->first;                   // "t" is a single term of X, eg {"x" -> 3, "ab" -> 5} [that is, x^3*ab^5]
            const double coeff = j->second;      // "coeff" is the coefficient corresponding to that term (a real number)
	    it = t.find(symbol);                 // Now, search the symbols in the term for one that matches the substitution symbol, e.g. it->first = {"x"}
            if(it == t.end()){                   // if(no match)...
                Xnew[t] = coeff;                 // ...then include term t and coeff unchanged in Xnew
	    } else {                             // else a match found.  If so, we want to effect 3x^2*y^5 /. {x -> 2} giving 12*y^3 [mathematica notation];  do three things:
              const signed int p=it->second;     // (1) extract the power, p, *before* erasing the iterator;
	      t.erase(it);                       // (2) Set the power of the matched symbol to zero (in t); and
	      Xnew[t] +=                         // (3) Add a new element to Xnew with term (updated) t...
              coeff * pow(value, p);             // ... and coefficient coeff*<var>^n using the saved value of n; note use of "+=" in case there is another term the same
            }                                    // if(match found) closes
	}                                        // j loop closes: go on to look at the next element of X
        X = Xnew;                                // update X to reflect changes
    }                                            // i loop closes: go on to consider the next element of substitution object s 
    return(retval(X));                           // return a pre-prepared list to R
}                                                // function mvp_substitute() closes

// [[Rcpp::export]]
List mvp_substitute_mvp(
              const List &allnames1, const List &allpowers1, const NumericVector &coefficients1, // original mvp
              const List &allnames2, const List &allpowers2, const NumericVector &coefficients2, // mvp to substitute with
              const CharacterVector &v                                                           // symbol to substitute for
    ){

    const mvp X = prepare(allnames1, allpowers1, coefficients1);  // original mvp object
    const mvp Y = prepare(allnames2, allpowers2, coefficients2);  // mvp object to substitute v for


    mvp::const_iterator i;
    term::iterator it;
    
    mvp Xnew,Xtemp;

    for(i = X.begin() ; i != X.end() ; ++i){ // Iterate through  X; e.g. i->first = {"x" -> 3, "ab" -> 5} [that is, x^3*ab^5] and i->second=2.2 [that is, 2.2 x^3*ab^5]
        term t = i->first;                   // "t" is a single _term_ of X, eg {"x" -> 3, "ab" -> 5} [that is, x^3*ab^5]
        const double coeff = i->second;      // "coeff" is the coefficient corresponding to that term (a real number)
        it = t.find((string) v[0]);          // Now, search the symbols in term "t" for one that matches the substitution symbol
        if(it == t.end()){                   // if(no match)...
            Xnew[t] += coeff;                // ...then include term t and coeff unchanged in Xnew
        } else {                             // else a match found.  If so, we want to effect things like 3x^2*y^5z /. {t -> 1+a} giving 3x^2*(1+a)^5*z
            const signed int psubs=it->second; // "psubs" is "the power of the variable being substituted for"
            if(psubs<0){throw std::range_error("negative powers cannot be substituted for");}
            t.erase(it);                     // Remove the matched symbol from t
            Xtemp.clear();                   // Clear Xtemp, now the zero polynomial
            Xtemp[t] = coeff;                // Algebraically, Xnew = coeff*term-without-match
            Xtemp = product(Xtemp, power_int(Y, psubs));  // this is the "meat" of the function
            Xnew = sum(Xnew,Xtemp);          // Take cumulative sum
        }                                    // if(match found) closes
    }                                        // i loop closes: go on to consider the next element of X
    return(retval(Xnew));                    // return a pre-prepared list to R
}                                            // function mvp_substitute() closes


// [[Rcpp::export]]
NumericVector mvp_vectorised_substitute(
              const List &allnames, const List &allpowers, const NumericVector &coefficients,    // original mvp
              const NumericVector &M, const int &nrows, const int &ncols, const CharacterVector &v // things to substitute in

    ){

    const mvp X = prepare(allnames, allpowers, coefficients);  // original mvp object
    subs s; 
    term::const_iterator it;
    mvp::const_iterator ix;
    double w;
    Rcpp::NumericVector out(nrows);
    
    for(int i=0 ; i<nrows ; i++){             // main loop, one iteration per row of M
        out[i] = 0;                            // initialize at zero
        s.clear();                              // clear s before we populate it 
        for(int j=0 ; j<ncols ; j++){            // sic; we are going through row i of M
            s[(string) v[j]] = M[j*nrows + i];    // populate s with row i of M
        }                                          // j loop closes 
        for(ix = X.begin() ; ix != X.end() ; ++ix){ // iterate through (mvp) X
            const term t = ix->first;                // "t" is a single _term_ of (mvp) X
            w = ix->second;                    // w =  (double) coefficient of this term
            for(it=t.begin() ; it != t.end() ; ++it){// iterate through the symbols in term "t" for one that matches the substitution symbol
                w *= pow(s[it->first], it->second); // the meat
            }                                      // it loop closes
        out[i] += w;                             // also meat, I guess
        }                                       // i loop closes
    }
    return out;
}

series mvp_to_series(const mvp &X, const string &var){
    series out;
    mvp jj;
    mvp::const_iterator ix;
    
    for(ix=X.begin() ; ix!=X.end() ; ++ix){ // iterate through (mvp) X
        const term t = ix->first;          // ix->first is a term and ix->second its coefficient
        term tt = t;                      // create a copy of t that we can modify
        const signed int p = tt[var];    // p is the power of var (zero if var is absent from t)
        tt.erase(var);                  // remove var from tt (null operation if p=0);
        jj.clear();                    // erase single-term mvp object jj
        jj[tt] = ix->second;          // map the reduced term tt to the original coefficient of t
        out[p] = sum(out[p],jj);     // should be "out[p] += jj;"
    }                               // main loop closes
    return out;
}


// [[Rcpp::export]]
List mvp_to_series(
const List &allnames, const List &allpowers, const NumericVector &coefficients,
    const CharacterVector &v    // v[0] is a symbol
    ){
        
        signed int i;
        series::const_iterator io;
        
        series out = mvp_to_series(prepare(allnames,allpowers,coefficients), (string) v[0]);
        
        List mvpList(out.size());
        NumericVector power(out.size());
        
        for(io=out.begin(), i=0;  io != out.end() ; ++io, i++){
            mvpList[i] = retval(io->second);
            power[i] = io->first;
        }
        
        return List::create(
            Named("mvp") = mvpList,
            Named("varpower") = power
            );
}
