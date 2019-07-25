2+8 # ctrl+enter for next line; alt_enter to remain in the same line.
# comment symbol

1:50 # print nos 1 to 50 in console.

50:1 # print  nos 50 to 1 in console, in reverse order of above

print("Hello World")# key words are case sensitive

print( 'Hello World wow')  # Like Python, both double/ signle quote works

# ctrl+L to clear the console
# alt+ '-' is the shortcut for assignment operator.
#ctrl+l to clear the console

x <- 1:5 # assigning nos 1 to 5 to object x.

y = 1:5  # <-, == both are assignment operator, but using <- is best practice.
y
y <-  c(3,5,8,1,2,'wow',"ok") # c is the concatenation operator
y
y <- c(3,5,8,1,2,9,16,3,3,3)

a <- x+y

z <- 4:9

x+z

# Note x,z are int data type as its following sequence. a, z are num as its following my own sequence.

ls()# list objects. This list all objects we created in this session.

# package is collection of codes and functions , which is already written. available for reuse.

install.packages("XML") # go to tools -> install packages. Also go t o packages, click install.

library (XML) # to use the XML package, post the installation we need to use library of XML.
# equivalent to library ("XML") is-> go to packages, select the "XML". The tick mark is equvalent operation here.

version # list version of R

CC <- read.csv("C:/Users/rar7sv/OneDrive - BP/RAJENDRAN/Raj/Material/Data Science/Sample Data Files/Evap.csv")
# to load csv file into R

View(CC) # to view the csv file.

?read.csv # to get more dtails of this function.

getwd() # get the current working directory
# setgw("c:/users/desktop") # to set any new directory as working directory

update.packages() # same operation can be done from Tools-> updtae packages

##########

# to connec to ODBC sources:
install.packages("RODBC")
library("RODBC")
odbcDataSources()
odbcConnectAccess()
sqlFetch() # Explore all these.

install.packages('rvest')
library('rvest')
d <- readLines("https://towardsdatascience.com/") # explore web page reading

browseURL("https://towardsdatascience.com/")
install.packages("Rcurl")

?`base-package`
browseURL()

##############

library() # to know what packages installed in my machine

install.packages("xlsx")
library("xlsx")
require("xlsx") # This is same as library.

library( help="xlsx") # to get more help of this package
vignette(package="xlsx") # written desc of the package
vignette() # List the desc for all packages
browseVignettes()

rm( list =ls()) # This removes all objects definition ( from the env tab) in one shot.

##############
###Part IV
#############
# Vector is collection of elements

temp <- c(1,2,3,"wow")
mean(temp)
mean(1,2,3)

rain <-  list("A","B","C")
temp <- list(1,2,3)
temp1 <- list(4,5,6)
# temp, temp1 are ex for vectors

raintemp <- list(rain,temp)
print(raintemp)

t1 <- c(1,2,3)
t2 <- c(4,5,6)
matrix(c(t1,t2),nrow=2,byrow=T)
matrix(c(t1,t2),ncol=2,byrow=T)
matrix(c(t1,t2),ncol=2,nrow=2,byrow=T)
t3=c("A","B","C")
t4= c(0,"X","Y")
matrix(c(t1,t3),nrow=2,byrow=T)
df = data.frame(t1,t2,t3,t4)
df
class(df)
length(df)
nrow(df)
ncol(df)
dim(df) # no of row, no of col is the dimension of dataframe
str(df) # shows structure of data frame

# user defined function
cube <- function (x) {x*x*x}
cube(2)
cube(1:5)

# inbuilt function:
a <-  seq(0,1,.1)
a
b <- seq(1,0,-0.1)
b

# Dealing with dataset:

volcano_DS <- read.csv("C:/Users/rar7sv/OneDrive - BP/RAJENDRAN/Raj/Material/Data Science/Sample Data Files/volcano_data_2010.csv")
View(volcano_DS)
Ordered = order(volcano_DS$Elevation) # arrange dataset in asc order based on Elevation column
volcano_DS=volcano_DS[Ordered,] # always [ rows, columns]
View (volcano_DS)

volcano_DS[rev(order(volcano_DS$Elevation)),]
# arrange dataset in desc/rev order based on Elevation column
volcano_DS[1:3,]
volcano_DS[c(1,6,9),]

# Dealing with Datasets: Inner join, Left outer join, Union all

Ex1 <- cbind(dataset1,dataset2) # columnbind.used to combine 2 dataset with unequal columns, same no of records though.
Ex2 <- rbind(dataset3,dataset4) #rowbind.Equavalent to UNION ALL.used to combine 2 dataset with unequal rows, same no of records though.
Ex3 <- merge(dataset5,dataset6) # This is equivalent to INNER JOIN in SQL
Ex3 <- merge(dataset5,dataset6,all=TRUE) # This is equivalent to Left Outer JOIN in SQL

SUM(dataset6$salesamt) # result ll be null, as this column has NA values ( like nul)
SUM(dataset6$salesamt,na.rm=TRUE) # result ll be sum of salesamt as NA values in this column has been removed.

# Array:

b <- array(1:30, c(5,3,2)) # c(no of rows, no of columns, no of arrays/tables)
b
b[,1:2,] # rows, columns, tables

# Available R datasets
data() # Lists all available sample datasets
data('EuStockMarkets') # import the specified dataset
?EuStockMarkets # provides help/ detail abt this dataset


# Data Transformations:

victim <- readLines("C:/Users/rar7sv/OneDrive - BP/RAJENDRAN/Raj/Material/Data Science/Work Area/R/victims.txt")
victim
View(victim)

df1 <- data.frame(victim)
df1
class(df1)
length(df1)
nrow(df1)
ncol(df1)
dim(df1)
str(df1)

comments <- grepl("^%",victim) # retruns True where row starts woth %
comments1 <- grep("^%",victim) # returns the row nos, which starts with %
comments
comments1

text <- victim[!comments]
text

text[1]
x <- text[1]
x
y <- sub("[[:digit:]]","",x) # (pattern, replacement,x). This replace the first digit
y

y <- gsub("[[:digit:]]","",x) # (pattern, replacement,x). This replace all digits
y

#another ex
text[9]

r <- regexpr("1",text[9]) # find if 1 is there , if yes return TRUE
r

r <- gregexpr("9",text[9]) # find if 9 is there , if yes return all positins
r

text

splitLines <- strsplit(text,split=",")
splitLines

Lines <- matrix(unlist(splitLines),nrow=length(splitLines), byrow=TRUE)
Lines
colnames(Lines)<- c("Name",'BirthYear',"DeathYear")

Lines

titanic_victims <- as.data.frame(Lines,stringasFactors=FALSE)
titanic_victims

class(titanic_victims$BirthYear)

titanic_victims$BirthYear <- as.numeric(titanic_victims$BirthYear)#coersion, means forcefully converting the datatype to another
titanic_victims$BirthYear
class(titanic_victims$BirthYear)

titanic_victims <- transform(titanic_victims,BirthYear=as.numeric(BirthYear),
                             DeathYear=as.numeric(DeathYear))

titanic_victims

data()

getwd()






