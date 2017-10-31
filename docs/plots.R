#
#HISTORY
#

#Timeline Plot from:
#http://stackoverflow.com/questions/20695311/chronological-timeline-with-points-in-time-and-format-date

#Create a Data Frame (see file)
df <- read.csv("myfile.csv")

#Add a column to Data Frame: YM
#Convert between Char representation to Date class object
df$YM <- as.Date(paste0("01",df$YearMonth), format="%d%Y%m")
#print(df)

#Create a vector from my range of dates
rangeYM <- range(df$YM)

#
#Create a custom Timeline Plot
#

#Define Plot Options
plot(NA,ylim=c(-1,1),xlim=rangeYM,ann=FALSE,axes=FALSE)

#Add a straight line to Plot
abline(h=0,lwd=2,col="#5B7FA3")

#Define the range of Y points
#Skip NA values
ypts <- rep_len(c(-1,1), length.out=nrow(df))

#Define the range of text labels
#Skip NA values
#Draw line segments between pairs of points
txtpts <- rep_len(c(1,3), length.out=nrow(df))

#Draw line segments between pairs of points
#Connect Timeline to Event Labels with a line
#Set color and length (=ypts)
segments(df$YM,0,df$YM,ypts,col="gray80")

#Function to plot objects of class "Date" representing calendar dates and times
axis.Date(
 1, #an integer specifying which side of the plot the Date object is to be drawn on: 1=below, 2=left, 3=above and 4=right
 at=seq.Date(rangeYM[1],rangeYM[2],by="month"),     #A date-time or date object.
                                                        #seq.Date is seq method for Date class objects
                                                           # by= increment of the sequence by.. month, year,etc
 format="%Y-%m",    #The default for the format methods is TIMESTAMP
 cex.axis=0.6,  #Specify the size of the tick label numbers/text
 pos=0,     #A position specifier for the text
 lwd=0,     #the line types and widths for lines
 lwd.tick=2,
 col="#5B7FA3", #label color
 font=2         #font size
)

#Draw a sequence of points at the specified coordinates
points(df$YM,y=ypts, pch="-", cex=1.5, col="#5B7FA3")

#Set graphical parameters for xpd
#FALSE= all plotting is clipped to the plot region, TRUE= all plotting is clipped to the figure region, NA, all plotting is clipped to the device region
par(xpd=NA)

#Draws the strings given in the vector labels at the coordinates given by x and y
    #labels= A character vector or expression specifying the text to be written: paste column values with \n separator
    #cex= numeric character expansion factor
    #pos = A position specifier for the text: as defined in vector txtpts (see above)
text(
  df$YM, y=ypts,
  labels=paste(df$SchoolCompany,df$Place,df$Event,sep="\n"), cex=0.7, pos=txtpts
)

#Set graphical parameters for xpd (see above)
par(xpd=FALSE)



#
#THAT'S ME!
#
Prop=c(4,2,3,5)
# Make the default Pie Plot
# You can also custom the labels:
pie(Prop, labels = c("SysAdmin","Developer","Databases","Text Processing"), col=brewer.pal(4, "Accent"))

#
#FOREIGN LANGUAGES
#
languages=c(3.5,4.5,5)
names(languages)=c("English","Spanish","Italian")
#increase margin
par(mar=c(4,6,4,4))
# Horizontal Barplot:
barplot(languages, col=brewer.pal(3, "Accent"), horiz=T , las=1)

#
#TECHNOLOGY KNOWLEDGE
#
num <- c(4.5,4,3.5,3,1.5,1,5)
labels <- c("Regex","Bash","Perl","SQL","Hadoop","R","NLP")
data <- data.frame(num, labels)
data2  <- data[order(data[,1],decreasing=FALSE),]
par(mar=c(4,6,4,4))
barplot(data2[,1],names.arg=data2[,2], col=brewer.pal(7, "Accent"), horiz=T ,las=1 )

#
#INDUSTRY KNOWLEDGE
#

# Library
library(fmsb)
# Create data
data=as.data.frame(matrix( c(20,10,5,15,10) , ncol=5))
colnames(data)=c("Automotive" , "Publishing" , "Project-Planning" , "Mixed Economy" , "Import/Export" )
 
# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
data=rbind(rep(20,10) , rep(0,10) , data)
par(xpd=NA)
#par(mar=c(4,4,8,4))

# The default radar chart proposed by the library:
#radarchart(data)
 
# Custom the radarChart !
radarchart( data  , axistype=1 , 
 
    #custom polygon
    pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 
 
    #custom the grid
    cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8)

#
#OTHER STUFF
#

#Insert a Wordcloud here

#Charge the wordcloud library
library(wordcloud)
 
#Create a list of words (Random words concerning my work)
a=c("LaTeX","HTML", "CSS", "XML", "XSL", "Json", "Tokenizers", "N-Grams", "Spider Web", "Perl DBI", "Fuzzy Matching", "Corpora", "Soundex")
 
#I give a frequency to each word of this list 
b=sample(seq(0,1,0.01) , length(a) , replace=TRUE) 
 
#The package will automatically make the wordcloud !
par(xpd=FALSE)
wordcloud(a , b , scale=c(5,0.7), colors=brewer.pal(6, "Dark2") , rot.per=0.35, use.r.layout=FALSE, random.order=FALSE)
 

############################################################################à

#Minimal pairs in Morphology
#compute Levenshtein distance
#It should be =1
#strs<-c("pane","rane","cane","tane","nane")
#using R default adist()
#adist(strs,"pane")