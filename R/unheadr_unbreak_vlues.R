#' @title Unbreak values using regex to match the broken half of the value
#' @description Unbreak values using regex to match the broken half of the value
#' @param df A data frame with one or more values within a variable broken up across two rows.
#' @param regex	Regular expression for matching the second half of the broken values.
#' @param ogcol	Variable to unbreak.
#' @param newcol Name of the new variable with the unified values.
#' @param sep Character string to separate the unified values (default is space).
#' @param .slice_groups	When `.slice_groups = FALSE` (the default), the extra rows and the variable with broken values will not be dropped.
#'
#' @return dataframe
#'
#' @examples
#' data(primates2017_broken)
#' regex matches strings starting in lowercase (broken species epithets)
#' unheadr_unbreak_vlues(primates2017_broken, "^[a-z]", scientific_name, sciname_new)
#'
#'
#' @rdname unheadr_unbreak_vlues
#' @export



unheadr_unbreak_vlues <- unheadr::unbreak_vals
