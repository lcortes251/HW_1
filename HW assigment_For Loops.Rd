library(affy)
library(GEOquery)
library(limma)
url <- "ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE1nnn/GSE1000/matrix/GSE1000_series_matrix.txt.gz"
filenm <- "GSE1000_series_matrix.txt.gz" 
if(!file.exists(filenm)) download.file(url, destfile=filenm)
gse <- getGEO(filename=filenm)
treatment <- exprs(gse[,1:5])
control <- exprs(gse[,6:10])
nrow(treatment)
nrow(control) #checks for how many rows you have. 

for(row in 1:nrow(treatment)){sum=0 for(col in 1:5){sum=sum+treatment[row,col]}print(sum/5)}

for(row in 1:nrow(treatment)){
	sum=0
	for(col in 1:5){
		sum=sum+treatment[row,col]
	}
	print(sum/5)
}

for(row in 1:nrow(control)){
	sum=0
	for(col in 1:5){
		sum=sum+control[row,col]
	}
	print(sum/5)
}

#this finds the average across the 5 treatment or control groups for each row. Indenting needs to be exactly the same as above or the code will not work if it is all in one line. 
