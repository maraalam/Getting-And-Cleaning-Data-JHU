HTMLurl <- "http://biostat.jhsph.edu/~jleek/contact.html"
conn <- url(HTMLurl)

htmlCode <- readLines(conn)
close(con)

sapply(htmlCode[c(10, 20, 30, 100)], nchar)
