fileDir <- "/Users/ashikshafi/Desktop/Dissertation files/tweets downloaded/All tweets/"
inputFile <- "tweetsShelby.txt"
outputFile <- “tweetShelbySelected.txt"

#Creating a loop within the file directory 

for (i in 1:length(files)){inputFile <- files[i] outputFile <- paste0(gsub(".txt","",inputFile ),”_output.txt")}

# Counting text data as array data

mydata = read.csv(paste0(fileDir,inputFile), sep = "\n", quote = "", header = FALSE)
mydata <- as.vector(mydata[,1])

#Subsetting the file with related keywords

filteredRecords <- mydata[grep('RT',mydata,invert = TRUE)]
filteredRecords <- mydata[grep('privacy|NSA|Privacy|Surveillance|surveillance',mydata)]

#Deleting first 19 characters containing metadata from the each lines. 

for (i in 1:length(filteredRecords)){filteredRecords[i] <- substr(filteredRecords[i],19,nchar(filteredRecords[i]))}  #Finally, writing the newly created file on directory

write(filteredRecords,file = paste0(fileDir,outputFile))
#counting the total number of tweets

count <- 0
mydata = read.csv(paste0(inputDir,inputFile), sep = "\n", quote = "", header = FALSE)
mydata <- as.vector(mydata[,1])
for (i in 1:length(files)){  count <- count + length(mydata)}
print(count)
  
