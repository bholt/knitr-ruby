#!/usr/bin/Rscript
library("knitr")

## process the command line arguments - a single string with arg pairs separated by a space
args <- commandArgs(TRUE)        ## grab arguments
args <- strsplit(args, " ")[[1]] ## split on the space to get arg=value pairs
spl <- strsplit(args, "=")       ## split each arg=val pair into arg name & value
nams <- sapply(spl, `[`, 1)      ## extract argument names
vals <- sapply(spl, `[`, 2)      ## extract argument values
ind <- grepl("[0-9]+", vals)     ## index the numeric values;
vals[ind] <- as.numeric(vals[ind])  ## convert numeric strings to numeric values
vals[!ind] <- paste("'", vals[!ind], "'", sep = "") ## add `"` around string values
lose <- which(nams == "root.dir")   ## temp: drop the root.dir argument

## process argument value pairs back into a single string with R code...
call <- paste("list(", paste(nams[-lose], vals[-lose], sep = "=", collapse = ", "), ")", sep = "")
## ... which we then parse and evaluate to create a list containing named components for each
## argument name and the object in each component is the respective argument value
args <- eval(parse(text = call))
tmp <- do.call(opts_chunk$set, args) ## use this list as arguments to chunk options function

## hardcoded knitr package options - until we work out how best to have both package &
## chunk options supplied via command line argument
opts_knit$set(base.url="", base.dir=".", root.dir=NULL, self.contained=FALSE, verbose=FALSE)

## knit the document being processed; takes inpu from stdin and outputs to stdout
tmp <- knit(text = readLines(file("stdin")), output=stdout(), quiet=TRUE)

## note that objects `tmp` are just to stop objects returned by function that doesn't need
## to be assigned (do.call, knitr) spitting NULLs into the stdout stream.
