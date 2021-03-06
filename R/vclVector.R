#' @title Construct a vclVector
#' @description Construct a vclVector of a class that inherits
#' from \code{vclVector}.  This class points to memory directly on
#' the GPU to avoid the cost of data transfer between host and device.
#' @param data An object that is or can be converted to a 
#' \code{vector}
#' @param length A non-negative integer specifying the desired length.
#' @param type A character string specifying the type of vclVector.  Default
#' is NULL where type is inherited from the source data type.
#' @param ... Additional method to pass to vclVector methods
#' @return A vclVector object
#' @docType methods
#' @rdname vclVector-methods
#' @author Charles Determan Jr.
#' @export
setGeneric("vclVector", function(data, length, type=NULL, ...){
    standardGeneric("vclVector")
})

#' @rdname vclVector-methods
#' @aliases vclVector,vector
setMethod('vclVector', 
          signature(data = 'vector', length = 'missing'),
          function(data, length, type=NULL){
              
              if (is.null(type)) type <- typeof(data)
              if (!missing(length)) {
                  warning("length argument not currently used when passing
                          in data")
              }
              
              device_flag <- ifelse(options("gpuR.default.device") == "gpu", 0, 1)
              
              data = switch(type,
                            integer = {
                                new("ivclVector", 
                                    address=vectorToVCL(data, 4L, device_flag))
                            },
                            float = {
                                new("fvclVector", 
                                    address=vectorToVCL(data, 6L, device_flag))
                            },
                            double = {
                                new("dvclVector",
                                    address = vectorToVCL(data, 8L, device_flag))
                            },
                            stop("this is an unrecognized 
                                 or unimplemented data type")
                            )
              
              return(data)
              },
          valueClass = "vclVector")


#' @rdname vclVector-methods
#' @aliases vclVector,missing
setMethod('vclVector', 
          signature(data = 'missing'),
          function(data, length, type=NULL){
              
              if (is.null(type)) type <- getOption("gpuR.default.type")
              if (length <= 0) stop("length must be a positive integer")
              if (!is.integer(length)) stop("length must be a positive integer")
              
              device_flag <- ifelse(options("gpuR.default.device") == "gpu", 0, 1)
              
              data = switch(type,
                            integer = {
                                new("ivclVector", 
                                    address=emptyVecVCL(length, 4L, device_flag))
                            },
                            float = {
                                new("fvclVector", 
                                    address=emptyVecVCL(length, 6L, device_flag))
                            },
                            double = {
                                new("dvclVector",
                                    address = emptyVecVCL(length, 8L, device_flag))
                            },
                            stop("this is an unrecognized 
                                 or unimplemented data type")
              )
              
              return(data)
          },
          valueClass = "vclVector")
