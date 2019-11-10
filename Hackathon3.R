---
title: "viz.bank"
author: "hong"
date: "November 9, 2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
#give a working data name
raw<-full.bank
#look at raw data 
ls(raw)
str(raw)
summary(raw)

library(DataExlporer)
#disp raw data
plot_missing(raw)
plot_histogram(raw)
plot_density(raw)
plot_intro(raw)

plot_correlation(raw)
plot_correlation(raw, type="continuous")
#look at age correlate with AVG yearly balance,campaign,and poutcome
plot_correlation(raw[,c(1,6,12,13,16)])
#education with job, poutcome 
plot_correlation(raw[,c(2,4,16)])
plot_correlation(raw, type="discrete")


library(ggplot2)
ggplot(data=raw, aes(x=loan, y=age))+
  geom_count()

#function for flip to exchage x & Y
ggplot(data=raw, aes(x=age, y=balance))+
  geom_col()+
  geom_smooth()
  

library(dplyr)

#job correlate with education
raw %>%
  filter(education == c("primary")) %>%
plot_correlation(raw[,c(2,4)]) 


raw %>%
  group_by(age) %>%
  summarise(balance = mean(balance),
            n = n()) %>%
  ggplot(aes(x = age, y = balance))+
  geom_col()+
  geom_smooth(data = raw)

#age=84 outline
raw %>%
  filter(age == 84) %>%
group_by(age) %>%
  summarise(balance = mean(balance),
            n = n()) %>%
  ggplot(aes(x = age, y = balance))+
  geom_col()+
  geom_smooth(data = raw)


#age<84 
raw %>%
  filter(age < 84) %>%
  group_by(age) %>%
  summarise(balance = mean(balance),
            n = n()) %>%
  ggplot(aes(x = age, y = balance))+
  geom_col()+
  geom_smooth(data = raw)

