#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyr)
library(dplyr)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    
    
    
    dSet<-reactive({
        output$num <- renderText(input$num)
        n <- input$num
        data <- mtcars
        mpg <- mtcars[,"mpg"]
        topPredictors(data,n,mpg)
        
        
    })
    
   output$vplot <- renderPlot({
            mpg<-rep(mtcars$mpg, each = input$num)
            list<-dSet()
            xnew<-as.data.frame(list[[1]])
            ggdata<-gather(xnew, "index", "value")
            ggdata <- mutate(ggdata, mpg = mpg)
           ## ggplot()+geom_line(data=ggdata,aes(x = mpgVal,y=value,group = index,color = index))
            ggplot(ggdata, aes(x=mpg,y=value,color=index))+geom_line()+facet_wrap(.~index, scales = "free")
        })
    
    output$pvals <- renderTable({
        list<-dSet()
        pmatrix<-list[[2]]
        pmatrix$Pvalues <- as.character(pmatrix$Pvalues)
        pvals<-pmatrix
    })

})

topPredictors<-function(x,y,z){
    
    p<-ncol(x)
    if(p == y){
        return(x[,1:y])
    }
    pvalues<-numeric(p)
    pvalues[1] = 100
    for(i in 2:p){
        fit<-lm(z~x[,i])
        summ <- summary(fit)
        pvalues[i] <- summ$coefficients[2,4]
    }
    ord <- order(pvalues)
    ord <- ord[1:y]
    cols<-colnames(x[ord])
    pvals<-pvalues[ord]
    pmatrix<-data.frame(Predictors = cols,Pvalues = pvals)
    xnew <- as.data.frame(x[ord])
    list<-list(xnew = xnew, pmatrix = pmatrix)
    return(list)
    
}
