library(arules)
library(arulesViz)

basket <- read.transactions('COLOCAR O DIRETÓRIO DO ARQUIVO.CSV',
                             format="basket",
                             sep="|",
                             rm.duplicates = T)
inspect(basket)

summary(basket)

regras <- apriori(
                  basket,
                  parameter = list(support = 0.001,
                                   confidence = 0.001,
                                   minlen = 2,
                                   maxlen = 20)
                  )


plot(regras, method = "scatter", engine = "htmlwidget", max = 300)

plot(regras, method = "graph", engine = "htmlwidget", max = 300)

df <- as(regras, "data.frame")
View(df)
