library(sqldf)

if(!file.exists("data/AmericanCommunitySurvey")){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    download.file(url = fileUrl, destfile = "data/AmericanCommunitySurvey")
    dateDownloaded <- date()
}

acs <- read.csv(file = "data/AmericanCommunitySurvey.csv", header = TRUE, sep = ",")
head(acs,n=4)

unique(acs$AGEP)

sqldf("select distinct AGEP from acs")
