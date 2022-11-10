install.packages("XML")
library("XML")

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- XML::xmlTreeParse(sub("s", "", fileURL), useInternal = TRUE)

rootNode <- XML::xmlRoot(doc)
zipcodes <- XML::xpathSApply(rootNode, "//zipcode", XML::xmlValue)

xmlZipcodeDT <- data.table::data.table(zipcode = zipcodes)
xmlZipcodeDT[zipcode == "21231",]

