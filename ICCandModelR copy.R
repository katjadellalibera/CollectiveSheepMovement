# import FID and ET data
df.FID <- read.csv("/Users/katjad/Documents/Github/SheepCapstone/indexAndFID.csv", col.names = c("index", "FID"))
df.ET <- read.csv("/Users/katjad/Documents/Github/SheepCapstone/indexAndET.csv", col.names = c("index", "buckets"))

# install necessary packages
install.packages("rptR")
library(rptR)

# test repeatability for FID
rpt(FID ~ (1 | index), grname = "index", data = df.FID, datatype = 'Gaussian',
    nboot = 1000, npermut = 0)

# test repeatability for ET
rpt(buckets ~ (1 | index), grname = "index", data = df.ET, datatype = 'Gaussian',
    nboot = 1000, npermut = 0)


citation("rptR")

