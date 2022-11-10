
# Getting and Cleaning Data Quiz 1 (JHU) Coursera

Question 1
----------
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

and load the data into R. The code book, describing the variable names is here:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

How many properties are worth $1,000,000 or more?


* 2076
* 31
* 53
* 159


SOLUTION
Next image, extracted from file https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf, shows the proper column to choose when filtering data and how to get rows with a property value that are worth $1,000,000 or more.

![image](https://user-images.githubusercontent.com/60483752/200642122-d7f70c93-4671-4cea-88a1-bc78378b05c9.png)


```R
library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url = fileUrl, destfile = "IdahoHousingData.csv")

data <- read.csv("data/IdahoHousingData.csv")

sum(data$VAL == 24, na.rm = TRUE)

>> [1] 53
```


Question 2
----------
Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate?

### Answer
Tidy data one variable per column




Question 3
----------
Download the Excel spreadsheet on Natural Gas Aquisition Program here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx

Read rows 18-23 and columns 7-15 into R and assign the result to a variable called "dat".

What is the value of:
```R
sum(dat$Zip*dat$Ext,na.rm=T)
```
(original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)

```R
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = paste0(getwd(), 'data/NaturalGasAquisitionProgram.xlsx'), method = "curl")

dat <- xlsx::read.xlsx(file = "data/NaturalGasAquisitionProgram.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

>> [1] 36534720
```


Question 4
--------------
Read the XML data on Baltimore restaurants from here:

http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml

How many restaurants have zipcode 21231?


```R
# install.packages("XML")
library("XML")

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- XML::xmlTreeParse(sub("s", "", fileURL), useInternal = TRUE)

rootNode <- XML::xmlRoot(doc)
zipcodes <- XML::xpathSApply(rootNode, "//zipcode", XML::xmlValue)

xmlZipcodeDT <- data.table::data.table(zipcode = zipcodes)
xmlZipcodeDT[zipcode == "21231", .N]

# Answer: 
# 127
```

Question 5
---------------
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv

using the fread() command load the data into an R object "DT".

The following are ways to calculate the average value of the variable "pwgtp15" broken down by sex using the data.table package?

```
#use function system.time(...)
DT[,mean(pwgtp15),by=SEX]

```

