#' @title turn image file to ggplot object.
#' @description turn image file to ggplot object. this is useful to use other ggplot2 function
#' @param image_file the url of image
#' @return ggplot object
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #image_to_ggplot('https://i.loli.net/2020/03/11/nG2X1S8EWMVFi3w.png')
#'  }
#' }
#' @seealso 
#'  \code{\link[magick]{editing}}
#'  \code{\link[ggplot2]{ggplot}},\code{\link[ggplot2]{annotation_raster}},\code{\link[ggplot2]{coord_fixed}}
#' @rdname image_to_ggplot
#' @export 
#' @importFrom magick image_read
#' @importFrom ggplot2 ggplot annotation_raster coord_fixed
image_to_ggplot <- function(image_file) {
    image <- magick::image_read(image_file)
    image_gg <-
        ggplot2::ggplot() +
        ggplot2::annotation_raster(
            image,
            xmin = -Inf,
            xmax = Inf,
            ymin = -Inf,
            ymax = Inf
        ) +
        #ggpubr::background_image(image) +
        ggplot2::coord_fixed()
    return(image_gg)
}

