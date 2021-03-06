library(plotly)
library(dplyr)

# This is not filtering on size :( and the year isn't working either
BuildGraph1 <- function() {
  dataset <- read.csv("./data/2017playerdata.csv")
  topAst <- head(arrange(dataset,desc(AST)),n=25 )
  x.equation <- paste0("~", "aUSG.")
  y.equation <- paste0("~", "AST")
  graph <- plot_ly(
    data = topAst, 
    x = eval(parse(text = x.equation)), 
    y = eval(parse(text = y.equation)),
    color = ~Tm, size=0.5,
    sizes= c(5, 20),
    type = 'scatter',
    mode = 'markers', hoverinfo = 'text',
    text = ~paste('Player: ', Player,
                  '</br>Team Name: ', Tm,
                  '</br> Assists Per Game: ', AST,
                  '</br> Usage Rate: ', aUSG.
    )
  )
  return (graph)
}

BuildGraph1()

