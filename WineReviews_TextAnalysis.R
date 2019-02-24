#INSTALL AND LOAD PACKAGES ################################

pacman::p_load(pacman, tm, SnowballC)

library("tm")
library("quanteda")

library("wordcloud")
library("RColorBrewer")
library("ggplot2")
library("tidyverse")
library("readr")
library("stringr")
library("lubridate")
library("kableExtra")
library("sqldf")
library("htmlTable")


text_clustering <- function(wineCorpus,field) {
  
  wineCorpus <- tm_map(wineCorpus, PlainTextDocument)
  wineCorpus <- tm_map(wineCorpus, removePunctuation)
  wineCorpus <- tm_map(wineCorpus, removeWords, stopwords('english'))
  wineCorpus <- tm_map(wineCorpus, stemDocument)
  wineCorpus <- VCorpus(VectorSource(wineCorpus))
  wineCorpus <- tm_map(wineCorpus, removeWords, c('the', 'this','an','its','still', stopwords('english')))
  
  myDTM = TermDocumentMatrix(wineCorpus, control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  myDTM = TermDocumentMatrix(wineCorpus, control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  v = sort(rowSums(m), decreasing = TRUE)
  wordcloud(names(v), v, main = field, max.words = 100, colors=brewer.pal(8, "Dark2")) 
  
  ###10. WorldCloud - Top Rated Wines
  toprated <- subset(WRclData, points > 90)
  
  if ( field == 'description') {
    wineCorpus1 <- VCorpus(VectorSource(toprated$description))
  } else if ( field == 'variety') {
    wineCorpus1 <- VCorpus(VectorSource(toprated$variety))
  } else {
    wineCorpus1 <- VCorpus(VectorSource(toprated$designation))
  }
  
  wineCorpus1 <- tm_map(wineCorpus1, PlainTextDocument)
  wineCorpus1 <- tm_map(wineCorpus1, removePunctuation)
  wineCorpus1 <- tm_map(wineCorpus1, removeWords, stopwords('english'))
  wineCorpus1 <- tm_map(wineCorpus1, stemDocument)
  wineCorpus1 <- VCorpus(VectorSource(wineCorpus1))
  wineCorpus1 <- tm_map(wineCorpus1, removeWords, c('the', 'this','an','its','still', stopwords('english')))
  
  myDTM1 = TermDocumentMatrix(wineCorpus1, control = list(minWordLength = 1))
  
  m1 = as.matrix(myDTM1)
  
  v1 = sort(rowSums(m1), decreasing = TRUE)
  wordcloud(names(v1), v1, max.words = 100, colors=brewer.pal(8, "Dark2"), main = field)
  
  
  return(TRUE)
}


getwd()
WRdata=read.csv("~/desktop/ML/YORK/Assigment2/wine-reviews/winemag-data_first150k.csv", header = TRUE, dec = ".", stringsAsFactors = FALSE)
str(WRdata)
summary(WRdata)

#Removing any missing value that might be present in the WRdata
WRdata <- na.omit(WRdata)

nrow(WRdata)
head(WRdata)

#Subset to speed up the Cluster analysis
WRclData <- WRdata[1:5000,]

str(WRclData)

# Overall wordclouds
text_clustering(VCorpus(VectorSource(WRclData$description)),"description")
text_clustering(VCorpus(VectorSource(WRclData$variety)),"variety")
text_clustering(VCorpus(VectorSource(WRclData$variety)),"designation")



# CLEAN UP #################################################

# Clear workspace
rm(list = ls()) 

# Clear packages
pacman::p_unload(arules, arulesViz)

# Clear plots
dev.off()

# Clear console
cat("\014")  # ctrl+L

