% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/align.R
\name{align_comment}
\alias{align_comment}
\title{Align a highlighted region's assignment operators.}
\usage{
align_comment()
}
\value{
Aligns the comment sign assignment operators (\code{=}) within a
highlighted region.
}
\description{
Align a highlighted region's assignment operators.
}
\examples{
\dontrun{
remedy_example(
    c( "# Align # signs",
    "a = 12",
    "aaa = 13"),
    align_equal
    )
}
}
