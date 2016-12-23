#OS name count
x2 <- tblResults12$OS_NAME
x3 <- tblResults13$OS_NAME
x4 <- tblResults14$OS_NAME
x5 <- tblResults15$OS_NAME
osName <- c(x2, x3, x4, x5)
osNameYesCt <- table(osName)

osNameNoCt <- table(noBid$OS_NAME)

#rm(x2,x3,x4,x5, osName)

#OS version count
x2 <- tblResults12$OS_VERSION
x3 <- tblResults13$OS_VERSION
x4 <- tblResults14$OS_VERSION
x5 <- tblResults15$OS_VERSION
osVer <- c(x2, x3, x4, x5)
osVerYesCt <- table(osVer)

osVerNoCt <- table(noBid$OS_VERSION)

#rm(x2,x3,x4,x5,osVer)

#Browser count
x2 <- tblResults12$BROWSER
x3 <- tblResults13$BROWSER
x4 <- tblResults14$BROWSER
x5 <- tblResults15$BROWSER
osBwr <- c(x2, x3, x4, x5)
osBwr <- str_replace_all(osBwr, "\"", "")
osBwrYesCt <- table(osBwr)

osBwrNoCt <- table(noBid$BROWSER)

#rm(x2,x3,x4,x5,osBwr)


#Build contingency table
cnames <- c("yes bid", "no bid", "total")
rnames <- c(unique(osName), unique(osVer), unique(osBwr))
osCont <- matrix(nrow=length(rnames), ncol=2)

osCont[,1] <- c(osNameYesCt, osVerYesCt, osBwrYesCt)
osCont[,2] <- c(osNameNoCt, osVerNoCt, osBwrNoCt)
osCont <- cbind(osCont, apply(osCont, 1, sum))

colnames(osCont) <- cnames
rownames(osCont) <- rnames







chisq.test(, simulate.p.value = TRUE)