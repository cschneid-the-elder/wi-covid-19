#!/usr/bin/Rscript

covidTot<-read.table("~/covid-19b/data/tot.csv", header=FALSE,
sep=",", colClasses=c("Date", "integer", "integer", "integer", "integer"))

names(covidTot)[1] <- "date"
names(covidTot)[2] <- "totDeaths"
names(covidTot)[3] <- "newDeaths"
names(covidTot)[4] <- "newCases"
names(covidTot)[5] <- "newTests"
names(covidTot)

library("ggplot2")

ggplot(covidTot, aes(x=date, y=newCases)) +
	geom_point() +
	geom_smooth(method="auto", se=TRUE, fullrange=FALSE, level=0.95) +
	xlab("Date") +
	ylab("# New Cases") +
	labs(title="COVID-19 New Cases in WI")

dev.copy(png, "~/covid-19/tot-fit-to-curve.png")
dev.off()

q()

