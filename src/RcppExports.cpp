// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// cpp_gpu_vec_add
IntegerVector cpp_gpu_vec_add(IntegerVector A_, IntegerVector B_, IntegerVector C_, SEXP sourceCode_);
RcppExport SEXP bigGPU_cpp_gpu_vec_add(SEXP A_SEXP, SEXP B_SEXP, SEXP C_SEXP, SEXP sourceCode_SEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< IntegerVector >::type A_(A_SEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type B_(B_SEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type C_(C_SEXP);
    Rcpp::traits::input_parameter< SEXP >::type sourceCode_(sourceCode_SEXP);
    __result = Rcpp::wrap(cpp_gpu_vec_add(A_, B_, C_, sourceCode_));
    return __result;
END_RCPP
}
// rcpp_hello_world
List rcpp_hello_world();
RcppExport SEXP bigGPU_rcpp_hello_world() {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    __result = Rcpp::wrap(rcpp_hello_world());
    return __result;
END_RCPP
}