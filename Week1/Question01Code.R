library(data.table)

if(!file.exists("data/IdahoHousingData.csv")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
        download.file(url = fileUrl, destfile = "data/IdahoHousingData.csv")
        dateDownloaded <- date()
}

data <- read.csv("data/IdahoHousingData.csv")
head(data)

count <- sum(data$VAL == 24, na.rm = TRUE)
count
