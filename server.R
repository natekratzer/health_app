df<-read.csv("merged health stl.csv",header=TRUE)
library(shiny)
library(ggplot2)
library(classInt)
library(ggthemes)
library(grid)

rank_and_nb_group<-function(var, order="descending"){
  df$var <- df[[var]]
  if(order=="descending"){
    d.order<-df[order(-df$var),]
  }
  if(order=="ascending"){
    d.order<-df[order(df$var),]
  }
  ranks<-1:length(df$var)
  d.rank<-cbind(d.order,ranks)
  names<-paste(d.rank$ranks,".",sep="")
  names<-paste(names,d.rank$cz_name.x)
  d.graph<-cbind(d.rank,names)
  
  breaks<-classIntervals(d.graph$var,3,style="jenks")
  d.graph$color<-NA
  d.graph$color[d.graph$var<=breaks$brks[2]]<-"green"
  d.graph$color[d.graph$var>breaks$brks[2] & d.graph$var<=breaks$brks[3]]<-"yellow"
  d.graph$color[d.graph$var>breaks$brks[3]]<-"red"
  d.graph$round<-round(d.graph$var,2)
  d.graph$textfont<-"plain"
  d.graph$textfont[d.graph$cz_name.x=="Louisville"]<-"bold"
  d.graph$linecolor<-"white"
  d.graph$linecolor[d.graph$cz_name.x=="Louisville"]<-"black"
  d.graph
  
  p<-ggplot(data=d.graph,aes(x=factor(names, levels=rev(unique(names))),
                        y=var*100,fill=factor(color)))+guides(fill=FALSE)
  p<-p+geom_bar(stat="identity",color=rev(d.graph$linecolor))+coord_flip()+theme_tufte()
  if(order=="ascending"){
    p<-p+scale_fill_manual(values=c("green3","red2","yellow2"))
  }
  if(order=="descending"){
    p<-p+scale_fill_manual(values=c("red2","green3","yellow2"))
  }
  p<-p+theme(axis.text.y=element_text(hjust=0,face=rev(d.graph$textfont),
                                      size=12))
  p<-p+theme(axis.ticks=element_blank(),axis.text.x=element_blank())
  p<-p+geom_text(aes(label=round),hjust=1.1,size=5,fontface="bold")
  p<-p+labs(title="",x="",
            y="")
  p
}


shinyServer(
  function(input, output) {
    output$plot1 <- renderPlot({ 
      var1<-df[input$var1]
      var2<-df[input$var2]
      df$textfont<-"plain"
      df$textfont[df$Display=="LOU"]<-"bold"
      df$textcolor<-"black"
      df$textcolor[df$Display=="LOU"]<-"blue"
      p<-ggplot(df, aes(x=var1,y=var2))
      p<-p+geom_smooth(method="lm",se=FALSE, color="black", size=.5)
      p<-p+geom_text(aes(label=Display),fontface=df$textfont, color=df$textcolor)
      p<-p+theme_bw()
      p
    })
    output$plot2<-renderPlot({
      p2<-rank_and_nb_group(input$var1, order="descending")
      p2
  },width="auto", height="auto")
    output$plot3<-renderPlot({
      p3<-rank_and_nb_group(input$var2, order="descending")
      p3
    })



})    