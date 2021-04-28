#' @title Annotate Meaningful Formatting
#' @description  Annotate Meaningful Formatting
#' @param xlfilepath path to spreadsheet file (xlx or xlsx)
#' @param orig Variable to annotate formatting in
#' @param new Name of new variable with cell formatting pasted as a string.
#'
#' @return dataframe
#'
#' @examples
#' example_spreadsheet <- system.file("extdata/dog_test.xlsx", package = "unheadr")
#' excel_read_annotate_format(example_spreadsheet,orig = Task, new=Task_annotated)
#'
#'
#' @rdname excel_read_annotate_format
#' @export


excel_read_annotate_format <- unheadr::annotate_mf
