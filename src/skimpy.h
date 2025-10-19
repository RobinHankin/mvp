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

using std::string;
using std::map;
using Rcpp::List;
using Rcpp::NumericVector;
using Rcpp::CharacterVector;
using Rcpp::IntegerVector;
using Rcpp::Named;

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
        const CharacterVector names(jj);

        const SEXP kk = allpowers[i]; 
        const IntegerVector powers(kk);

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
