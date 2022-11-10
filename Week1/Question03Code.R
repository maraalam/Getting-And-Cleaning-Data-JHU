library(xlsx)

if(!file.exists("data/NaturalGasAquisitionProgram.xlsx")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
        download.file(fileUrl, destfile = "data/Natural_Gas_Aquisition.xlsx")
        dateDownloaded <- date()
}


dat <- xlsx::read.xlsx(file = "data/NaturalGasAquisitionProgram.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
value <- sum(dat$Zip*dat$Ext,na.rm=T)
value
