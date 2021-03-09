# import FID and ET data
df.FID <- read.csv("/Users/katjad/Documents/Github/SheepCapstone/indexAndFID.csv", col.names = c("index", "FID"))
df.ET <- read.csv("/Users/katjad/Documents/Github/SheepCapstone/indexAndET.csv", col.names = c("index", "buckets"))
df.TimeAlone <- read.csv("/Users/katjad/Documents/Github/SheepCapstone/indexAndTimeAlone.csv", col.names = c("index", "timeAlone"))


# install necessary packages
install.packages("rptR")
install.packages("lmerTest")
library(rptR)
library(lmerTest)

# test repeatability for FID
rpt(FID ~ (1 | index), grname = "index", data = df.FID, datatype = 'Gaussian',
    nboot = 1000, npermut = 0)

# test repeatability for ET
rpt(buckets ~ (1 | index), grname = "index", data = df.ET, datatype = 'Gaussian',
    nboot = 1000, npermut = 0)

# test repeatability for Time Alone
rpt(timeAlone ~ (1 | index), grname = "index", data = df.TimeAlone, datatype = 'Gaussian',
    nboot = 1000, npermut = 0)


# import dataset for LM
df.full <- read.csv("/Users/katjad/Documents/Github/SheepCapstone/LinearModelData.csv", col.names = c("index", "ET","FID","TimeAlone","GroupSize"))

# linear model for time alone
talm <- lmer(TimeAlone ~ FID + ET + (1|index), data = df.full)
summary(talm)