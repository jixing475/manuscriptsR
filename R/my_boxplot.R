#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param df PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  # Box plots with jittered points
# :::::::::::::::::::::::::::::::::::::::::::::::::::
# Change outline colors by groups: dose
# Use custom color palette
# Add jitter points and change the shape by groups
# Add p-values comparing groups: create comparisons 
#'  }
#' }
#' @seealso 
#'  \code{\link[purrr]{map}}
#'  \code{\link[manuscriptsR]{df_turn}}
#'  \code{\link[dplyr]{filter}}
#'  \code{\link[tidystringdist]{tidy_comb_all}}
#'  \code{\link[ggpubr]{ggboxplot}}
#'  \code{\link[ggsci]{scale_color_lancet}}
#' @rdname my_boxplot
#' @export 
#' @importFrom purrr map_df
#' @importFrom dplyr filter
#' @importFrom tidystringdist tidy_comb_all
#' @importFrom ggpubr ggboxplot
#' @importFrom ggsci scale_color_lancet
#' @importFrom ggpubr ggboxplot stat_compare_means

my_boxplot <- function(df, ...){
  meta <- 
    df %>% 
    purrr::map_df(~ class(.x)) %>% 
    df_turn() %>% 
    rownames_to_column("variable") %>% 
    set_names(c("variable", "class"))
  
  num <- meta %>% 
    dplyr::filter(class != "factor") %>% 
    pull(variable)
  
  fac <- 
    meta %>% 
    filter(class == "factor") %>% 
    pull(variable)
  
  my_comparisons <- 
    df %>% 
    pull(fac) %>% unique() %>% as.character() %>% 
    tidystringdist::tidy_comb_all() %>% 
    t() %>% as.data.frame() %>% 
    map(~ as.vector(.x))
  
  p <- ggpubr::ggboxplot(df, x = fac, y = num,
                 color = fac, shape = fac,
                 add = "jitter") +
    ggpubr::stat_compare_means(comparisons = my_comparisons) # Add pairwise comparisons p-value
    ggsci::scale_color_lancet()
  return(p)
}
