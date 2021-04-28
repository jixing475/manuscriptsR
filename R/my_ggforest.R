#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param rt PARAM_DESCRIPTION
#' @param forestCol PARAM_DESCRIPTION, Default: '#0D456B'
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname my_ggforest
#' @export 

my_ggforest <- function(rt, forestCol="#0D456B"){
  #rt from gtsummary
  gene <- rt$Characteristic %>% str_replace_all("_", "-")
  hr <- rt$HR
  hrLow  <- rt$`95% CI` %>% 
    map_chr(~ str_split(.x, ", ") %>% unlist %>% .[1])
  hrHigh <- rt$`95% CI` %>% 
    map_chr(~ str_split(.x, ", ") %>% unlist %>% .[2])
  Hazard.ratio <- rt$`95% CI` %>% str_replace(., ", ", "-")
  pVal <- ifelse(rt$`p-value`==0.001, "<0.001", rt$`p-value`)
  
  # pdf(file=forestFile, width = 6.3,height = 4.5)
  n <- nrow(rt)
  nRow <- n+1
  ylim <- c(1,nRow)
  layout(matrix(c(1,2),nc=2),width=c(3,2.5))
  
  
  xlim = c(0,3)
  par(mar=c(4,2.5,2,1))
  plot(1,xlim=xlim,ylim=ylim,type="n",axes=F,xlab="",ylab="")
  text.cex=0.8
  text(0,n:1,gene,adj=0,cex=text.cex)
  text(1.5-0.5*0.2,n:1,pVal,adj=1,cex=text.cex);text(1.5-0.5*0.2,n+1,'pvalue',cex=text.cex,font=2,adj=1)
  text(3,n:1,Hazard.ratio,adj=1,cex=text.cex);text(3,n+1,'Hazard ratio',cex=text.cex,font=2,adj=1,)
  
  
  par(mar=c(4,1,2,1),mgp=c(2,0.5,0))
  xlim = c(0,max(as.numeric(hrLow),as.numeric(hrHigh)))
  plot(1,xlim=xlim,ylim=ylim,type="n",axes=F,ylab="",xaxs="i",xlab="Hazard ratio")
  arrows(as.numeric(hrLow),n:1,as.numeric(hrHigh),n:1,angle=90,code=3,length=0.05,col="#32804C",lwd=2.5)
  abline(v=1,col="black",lty=2,lwd=2)
  boxcolor = ifelse(as.numeric(hr) > 1, forestCol, forestCol)
  points(as.numeric(hr), n:1, pch = 15, col = boxcolor, cex=1.3)
  axis(1)
  abline(v=1,col="black",lty=2,lwd=2)
}
