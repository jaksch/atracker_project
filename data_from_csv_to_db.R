library('RODBC')
library('readr')
library('stringr')

path_to_csv <- 'C:\\Users\\Jakob\\Dropbox\\MyTime\\CSVFile_2015-08-23_2015-08-29.csv'
data <- read_csv2(path_to_csv)
names(data) <- tolower(str_replace(str_trim(names(data)), ' ', '_'))
head(data)
str(data)

# path_to_csv <- 'C:\\Users\\Jakob\\Dropbox\\MyTime\\CSVFile_2015-08-16_2015-08-22.csv'

con <- odbcConnect('atracker')
sqlTables(con)
sqlSave(con, data, tablename = 'atracker_raw_data')
sqlTables(con)
odbcClose(con)



con <- odbcConnect('atracker')
query <- "SELECT * FROM atracker_raw_data"
dat <- sqlQuery(con, query, stringsAsFactors = FALSE)
odbcClose(con)
dat
head(dat)
str(dat)
