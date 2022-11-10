fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url = fileUrl, destfile = "data/data.for")

x <- read.fwf(file="getdata_wksst8110.for", skip=4, widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4)) #widths of columns in characters

sum(x$V4)
