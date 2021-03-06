% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wrappers-utils.R
\name{gpuInfo}
\alias{gpuInfo}
\title{GPU Information}
\usage{
gpuInfo(platform_idx = 1L, gpu_idx = 1L)
}
\arguments{
\item{platform_idx}{An integer value indicating which platform to query.}

\item{gpu_idx}{An integer value indicating which gpu to query.}
}
\value{
\item{deviceName}{GPU Name}

\item{deviceVendor}{GPU Vendor}

\item{numberOfCores}{Number of Computing Units 
 (which execute the work groups)}

\item{maxWorkGroupSize}{Maximum number of work items
 per group}

\item{maxWorkItemDim}{Number of dimensions}

\item{maxWorkItemSizes}{Maximum number of works items
 per dimension}

\item{deviceMemory}{Global amount of memory (bytes)}

\item{clockFreq}{Maximum configured clock frequency of the 
device in MHz}

\item{localMem}{Maximum amount of local memory for each work 
group (bytes)}

\item{maxAllocatableMem}{Maximum amount of memory in a single 
piece (bytes)}

\item{available}{Whether the device is available}
}
\description{
Get basic information about selected GPU
}
\author{
Charles Determan Jr.
}
\seealso{
\link{detectPlatforms} \link{detectGPUs}
}

