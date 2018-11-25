// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-

#define container vector         // Could be 'vector' or 'deque' (both work but there may be performance differences)
#define USE_UNORDERED_MAP true   // set to true for unordered_map; comment out to use plain stl map.

#include <Rcpp.h>
#include <cmath>

#include <string.h>
#include <iostream>
#include <unordered_map>
#include <vector>
#include <deque>
#include <utility>
#include <iterator>

using namespace std;
using namespace Rcpp; 

typedef container <signed int> mypowers;  // a mypowers object is a container [vector or deque] of signed integers (the powers of the variables)
typedef container <string> mynames;  // a mynames object is a container [vector or deque] of strings...

typedef map <string, signed int> term; //... and a 'term' object is a map from a string object to an integer; thus a^2 b^3 is 'a' -> 2, 'b' -> 3
typedef map <term, double> mvp;  // ... An 'mvp' object (MultiVariatePolynomial) is a map from a term object to a double.



mvp zero_coefficient_remover(const mvp &X){
    mvp out;
    for(mvp::const_iterator it=X.begin() ; it != X.end() ; ++it){
        const term t = it->first;
        const double coef = it->second;
        if(coef != 0){
            out[t] += coef;
        }
    }
    return out;
}

term zero_power_remover(const term &t){
    term out;
    for(term::const_iterator it=t.begin() ; it != t.end() ; ++it){
        const string var = it->first;
        const int power = it->second;
        if(power != 0){
            out[var] += power;
        }
    }
    return out;
}
    


List retval(const mvp &X){   // takes a mvp object and returns a mpoly-type list suitable for return to R
    unsigned int i,j;
    mvp::const_iterator it;
    term::const_iterator ic;
    term oneterm;
    
    unsigned int n=X.size();
    List namesList(n), powerList(n);
    NumericVector coeff_vec(n);

    for(it = X.begin(), i=0 ; it != X.end() ; ++it, i++){
        oneterm = it->first; // oneterm is a 'term' object, a map from strings to integers
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
        SEXP jj = allnames[i]; 
        Rcpp::CharacterVector names(jj);

        SEXP kk = allpowers[i]; 
        Rcpp::IntegerVector powers(kk);

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

mvp product(const mvp X1, const mvp X2){
    mvp out;
    term t1new,t2;
    
    for(mvp::const_iterator it1=X1.begin() ; it1 != X1.end() ; ++it1){
        const term t1=it1->first;
        const double c1=it1->second; // coefficient
        for(mvp::const_iterator it2=X2.begin() ; it2 != X2.end() ; ++it2){
            t1new = t1;// we will modify t1new by adding stuff to it
            t2=it2->first;
            for(term::const_iterator is=t2.begin() ; is != t2.end() ; ++is){
                t1new[is->first] += is->second;  // add the powers of the variables in the two terms
            }  // is loop closes
            
            t1new = zero_power_remover(t1new);
            const double c2=it2->second; // coefficient of t2
            out[t1new] += c1*c2;  // NB inside the it2 loop

        }  //it2 loop closes
    } // it1 loop closes
    return zero_coefficient_remover(out);
}

mvp sum(const mvp X1, const mvp X2){
    mvp out=X1;
    
    for(mvp::const_iterator it2=X2.begin() ; it2 != X2.end() ; ++it2){
            out[it2->first] += it2->second;
    }
    return zero_coefficient_remover(out);
}

mvp power(const mvp X, unsigned int n){
    mvp out; // empty
    if(n==0){
        return out;
    } else {
        out = X; 
        for( ; n>1; n--){
            out = product(X,out);
        }
    }
    return out;
}

mvp deriv(const mvp X, const string v){// differentiation: dX/dv
    mvp out;

    for(mvp::const_iterator it=X.begin() ; it != X.end() ; ++it){
        term t=it->first;
        const signed int power = t[v];       
        t[v]--; // power reduces by one (maybe to zero...)
        t = zero_power_remover(t); // (...which is why we call zpr())
        out[t] = (it->second)* power ;  // coefficient multiplies by power
    }
    return zero_coefficient_remover(out); // eliminates terms with no v
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
    return retval(power(prepare(allnames,allpowers,coefficients), n[0]));
}

// [[Rcpp::export]]
List mvp_deriv(
              const List &allnames, const List &allpowers, const NumericVector &coefficients,
              const CharacterVector &v
               ){

    const mvp X = prepare(allnames, allpowers, coefficients);
    const unsigned int n=v.size();
    Rcpp::List out(n);
        
    for(unsigned int i=0 ; i<n ; i++){
        out[i] = retval(deriv(X, (string) v[i]));
    }
    return out;
}
        
/*
    
    
    return retval(
                  deriv(
                        prepare(allnames,allpowers,coefficients),
                        (string) v[0]
                        )
                  );
}


*/

                      
/*
following taken from:

https://stackoverflow.com/questions/12719334/how-to-handle-list-in-r-to-rcpp/12734655



In an R session:

library(inline)
fx <- cxxfunction(signature(x='List'), plugin='Rcpp', body = '
    Rcpp::List xlist(x);
    int n = xlist.size();
    Rcpp::NumericVector res(n);

    for(int i=0; i<n; i++) {
        SEXP ll = xlist[i];
        Rcpp::NumericVector y(ll);
        for(int j=0; j<y.size(); j++){
            res[i] += y[j];
        }
    }

    return(res);
')


Then we have:

R> x <- list(c(1,2,3),c(100,101),c(0,0,1,0,0))
R> fx(x)
[1]   6 201   1
R> 



*/


 /*

            for(term::const_iterator is=t1new.begin() ; is != t1new.end() ; ++is){
                const string v = (string) is->first;
                if(is->second==0){ t1new.erase(v); }
            }  //is loop closes; zero powers now cleared from t1new


 */
