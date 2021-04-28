#' @title transform variable to normal variable
#' @description transform variable to normal variable
#' @param y vector
#' @return vector
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[MASS]{boxcox}}
#' @rdname my_boxcox
#' @export 
#' @importFrom MASS boxcox
my_boxcox <- function(y) {
    #hist(y, breaks = 12)
    p_value <- shapiro.test(y) %>% .$p
    if(p_value <= 0.05){
        result = MASS::boxcox(y ~ 1)
        (mylambda = result$x[which.max(result$y)])
        print(mylambda)
        y_trans = (y ^ mylambda - 1) / mylambda
        #hist(y2)
        return(y_trans)
    } else{
        print("don't run transform")
        return(y)
    }
}
