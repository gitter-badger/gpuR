
// eigen headers for handling the R input data
#include <RcppEigen.h>

#include "gpuR/eigen_helpers.hpp"

// ViennaCL headers
#include "gpuR/vcl_colSums.hpp"

using namespace Rcpp;

//[[Rcpp::export]]
void cpp_vienna_fgpuMatrix_colsum(
    SEXP ptrA_, SEXP ptrC_)
{
    
    Rcpp::XPtr<dynEigen<float> > ptrA(ptrA_);
    Rcpp::XPtr<dynEigenVec<float> > ptrC(ptrC_);
    
    MapMat<float> Am(ptrA->ptr(), ptrA->nrow(), ptrA->ncol());
    MapVec<float> Cm(ptrC->ptr(), ptrC->length());

    cpp_vienna_colsum<float>(Am, Cm);
}

//[[Rcpp::export]]
void cpp_vienna_dgpuMatrix_colsum(
    SEXP ptrA_, SEXP ptrC_)
{
    
    Rcpp::XPtr<dynEigen<double> > ptrA(ptrA_);
    Rcpp::XPtr<dynEigenVec<double> > ptrC(ptrC_);
    
    MapMat<double> Am(ptrA->ptr(), ptrA->nrow(), ptrA->ncol());
    MapVec<double> Cm(ptrC->ptr(), ptrC->length());

    cpp_vienna_colsum<double>(Am, Cm);
}