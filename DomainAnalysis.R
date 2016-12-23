#Domain Frequency
#find overlapping domains between no_bids and yes_bids
#Take counts of these domains from yes_bid and no_bids
#perform chi square 

library(ggplot2)

#Counts number of instances of y in x
counter <- function(x, y){
  result <- x[names(x)==y]
  return(result)
}

#Find common domains between yes bid and no bid
yesDomain15 <- str_replace_all(tblResults15$DOMAIN, "\"", "")
yesDomain13 <- str_replace_all(tblResults13$DOMAIN, "\"", "")
yesDomain14 <- str_replace_all(tblResults14$DOMAIN, "\"", "")
yesDomain15 <- str_replace_all(tblResults15$DOMAIN, "\"", "")
yesDomain <- c(yesDomain15, yesDomain13, yesDomain14, yesDomain15)
noDomain <- noBid$DOMAIN
commonDomain <- intersect(yesDomain, noDomain)

#Get yes_bid domain count
yesDomainCount <- integer(length = length(commonDomain))
yesDomainTbl <- table(yesDomain)
for(i in 1:length(commonDomain)){
  yesDomainCount[i] <- counter(yesDomainTbl, commonDomain[i])
}

#Get no_bid domain count
noDomainCount<-integer(length = length(commonDomain))
noDomainTbl <- table(noDomain)
for(i in 1:length(commonDomain)){
  noDomainCount[i] <- counter(noDomainTbl, commonDomain[i])
}

#Build contingency table
contingency <- as.data.frame(matrix(nrow = length(commonDomain), ncol = 2))
cnames <- c("yes", "no", "total")
contingency[,1] <- yesDomainCount
contingency[,2] <- noDomainCount
contingency <- cbind(contingency, apply(contingency, 1, sum)) 
rownames(contingency) <- commonDomain
colnames(contingency) <- cnames
#contingency <- filter(contingency, total > 500)

#Chi-squared analysis (with simulate p value = TRUE because of some small counts)
#chisq.test(contingency)
#chisq.test(contingency)
chisq.test(contingency, simulate.p.value = TRUE)


#p=5E-4; it is strongly likely that domain and bid status are linked

#HEATMAP - what can we tell? e.g. Can see which domains are bid on and which are not, if yes column is darker than no
heatmap.2(as.matrix(contingency), dendrogram="none", scale="row")


#Daily analysis
commonDomain15 <- intersect(yesDomain15, noDomain)
commonDomain13 <- intersect(yesDomain13, noDomain)
commonDomain14 <- intersect(yesDomain14, noDomain)
commonDomain15 <- intersect(yesDomain15, noDomain)

yesDomain12Tbl <- table(yesDomain12)
yesDomain13Tbl <- table(yesDomain13)
yesDomain14Tbl <- table(yesDomain14)
yesDomain15Tbl <- table(yesDomain15)

#11/12 domain counts
yesDomain12Count <- integer(length = length(commonDomain12))
for(i in 1:length(commonDomain12)){
  yesDomain12Count[i] <- counter(yesDomain12Tbl,  commonDomain12[i])
}
noDomain12Count <- integer(length = length(commonDomain12))
for(i in 1:length(commonDomain12)){
  noDomain12Count[i] <- counter(noDomainTbl,  commonDomain12[i])
}

#11/13 domain counts
yesDomain13Count <- integer(length = length(commonDomain13))
for(i in 1:length(commonDomain13)){
  yesDomain13Count[i] <- counter(yesDomain13Tbl,  commonDomain13[i])
}
noDomain13Count <- integer(length = length(commonDomain13))
for(i in 1:length(commonDomain13)){
  noDomain13Count[i] <- counter(noDomainTbl,  commonDomain13[i])
}

#11/14 domain counts
yesDomain14Count <- integer(length = length(commonDomain14))
for(i in 1:length(commonDomain14)){
  yesDomain14Count[i] <- counter(yesDomain14Tbl,  commonDomain14[i])
}
noDomain14Count <- integer(length = length(commonDomain14))
for(i in 1:length(commonDomain14)){
  noDomain14Count[i] <- counter(noDomainTbl,  commonDomain14[i])
}

#11/15 domain counts
yesDomain15Count <- integer(length = length(commonDomain15))
for(i in 1:length(commonDomain15)){
  yesDomain15Count[i] <- counter(yesDomain15Tbl,  commonDomain15[i])
}
noDomain15Count <- integer(length = length(commonDomain15))
for(i in 1:length(commonDomain15)){
  noDomain15Count[i] <- counter(noDomainTbl,  commonDomain15[i])
}

#Contingency tables
cont12 <- as.data.frame(matrix(nrow = length(commonDomain12), ncol = 2))
cont12[,1] <- yesDomain12Count
cont12[,2] <- noDomain12Count
cont12 <- cbind(cont12, apply(cont12, 1, sum))
rownames(cont12) <- commonDomain12
colnames(cont12) <- cnames

cont13 <- as.data.frame(matrix(nrow = length(commonDomain13), ncol = 2))
cont13 <- as.data.frame(matrix(nrow = length(commonDomain13), ncol = 2))
cont13[,1] <- yesDomain13Count
cont13[,2] <- noDomain13Count
cont13 <- cbind(cont13, apply(cont13, 1, sum))
rownames(cont13) <- commonDomain13
colnames(cont13) <- cnames

cont14 <- as.data.frame(matrix(nrow = length(commonDomain14), ncol = 2))
cont14 <- as.data.frame(matrix(nrow = length(commonDomain14), ncol = 2))
cont14[,1] <- yesDomain14Count
cont14[,2] <- noDomain14Count
cont14 <- cbind(cont14, apply(cont14, 1, sum))
rownames(cont14) <- commonDomain14
colnames(cont14) <- cnames

cont15 <- as.data.frame(matrix(nrow = length(commonDomain15), ncol = 2))
cont15 <- as.data.frame(matrix(nrow = length(commonDomain15), ncol = 2))
cont15[,1] <- yesDomain15Count
cont15[,2] <- noDomain15Count
cont15 <- cbind(cont15, apply(cont15, 1, sum))
rownames(cont15) <- commonDomain15
colnames(cont15) <- cnames

#Chi-squared
chisq.test(cont12, simulate.p.value = TRUE)
chisq.test(cont13, simulate.p.value = TRUE)
chisq.test(cont14, simulate.p.value = TRUE)
chisq.test(cont15, simulate.p.value = TRUE)

#Heatmaps
heatmap.2(as.matrix(cont12), dendrogram="none", scale="row")

heatmap.2(as.matrix(cont13), dendrogram="none", scale="row")

heatmap.2(as.matrix(cont14), dendrogram="none", scale="row")

heatmap.2(as.matrix(cont15), dendrogram="none", scale="row")









