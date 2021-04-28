#' @title download article from sougou weixin
#' @description download article from sougou weixin
#' @param searchkey query string
#' @param maxpage PARAM_DESCRIPTION, Default: 2
#' @return dataframe
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname sougou_weixin
#' @export 

sougou_weixin <- function(searchkey, maxpage = 2) {
  allurl <- c()
  alltitle <- c()
  allsource <- c()
  
  for (temppage in c(1:maxpage)) {
    cat(temppage, '\r')
    
    url1 <- paste0("https://weixin.sogou.com/weixin?type=2&query=",URLencode(searchkey),"&page=", temppage, "&ie=utf8")
    web <- read_html(url1)
    #
    articlelink <- web %>% html_nodes("ul[class='news-list']") %>% 
      html_nodes("li") %>% html_nodes("h3") %>% 
      html_nodes("a[target='_blank']") %>% html_attr('href')
    articlelink <- sapply(X = articlelink, function(x){paste0('https://weixin.sogou.com', x)})
    names(articlelink) <- NULL
    #
    articletitle <- web %>% html_nodes("ul[class='news-list']") %>% 
      html_nodes("li") %>% html_nodes("h3") %>% html_nodes("a[target='_blank']") %>% html_text()
    # 
    sourcetitle <- web %>% html_nodes("ul[class='news-list']") %>% 
      html_nodes("li") %>% html_nodes("a[class='account']") %>% html_text()
    
    
    allurl <- c(allurl, articlelink)
    alltitle <- c(alltitle, articletitle)
    allsource <- c(allsource, sourcetitle)
    Sys.sleep(3)
  }
  
  result <- data.frame("title" = alltitle, "url" = allurl, "source" = allsource)
  return(as_tibble(result))
}


# searchkey <- "气泡图+R语言" # 
# res <- downarticle_fromsogou(searchkey = searchkey)
