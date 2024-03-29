% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/image_to_ggplot.R
\name{image_to_ggplot}
\alias{image_to_ggplot}
\title{turn image file to ggplot object.}
\usage{
image_to_ggplot(image_file)
}
\arguments{
\item{image_file}{the url of image}
}
\value{
ggplot object
}
\description{
turn image file to ggplot object. this is useful to use other ggplot2 function
}
\details{
DETAILS
}
\examples{
\dontrun{
if(interactive()){
 #image_to_ggplot('https://i.loli.net/2020/03/11/nG2X1S8EWMVFi3w.png')
 }
}
}
\seealso{
\code{\link[magick]{editing}}
 \code{\link[ggplot2]{ggplot}},\code{\link[ggplot2]{annotation_raster}},\code{\link[ggplot2]{coord_fixed}}
}
