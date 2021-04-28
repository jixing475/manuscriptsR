#' runCurrentRscript
#' @description Wrapper around \code{\link{system2}} to run Rscript with
#' default arguments for easy use as an RStudio addin
#' @param path \code{character(1)} string, specifying the path of the file to
#' be used as Rscript argument (ideally a path to an R script)
#' @param command \code{character(1)} to be executed, defaults to
#' \code{"Rscript"}, which is the originally intended use
#' @param outputFile \code{character(1)} string, specifying the name of the
#' file, into which the output produced by running the Rscript will be written
#' @param autoOpen \code{logical(1)} should we open the output automatically?
#' @param addRhome \code{logical(1)} add R home as prefix to command? Useful
#' if path to R is not added to the \code{"PATH"} environment variable
#' @importFrom rstudioapi getActiveDocumentContext
#' @importFrom rstudioapi navigateToFile
#' @seealso \code{\link{system2}}
#' @return side-effects
runCurrentRscript <- function(
  path = path.expand(rstudioapi::getActiveDocumentContext()[["path"]])
  , command = "Rscript"
  , outputFile = "output.txt"
  , autoOpen = TRUE
  , addRhome = TRUE) {
  if (isTRUE(addRhome)) {
    command <- file.path(R.home("bin"), command)
  }
  system2(
    command,
    args = c(path, "--vanilla"),
    stdout = outputFile,
    stderr = outputFile
  )
  if (!is.null(outputFile) && file.exists(outputFile) && isTRUE(autoOpen)) {
    rstudioapi::navigateToFile(outputFile)
  }
}

