# Book: http://www.wiley.com/WileyCDA/WileyTitle/productCd-1118810082.html
# I'd recommend buy the e-book or by other means. 
# What we talked about today:
# Steps 1. get and clean all the data
# Steps 2. explore each variable
#     -  visualize distribution, look for outliers
# Step 3: export relationships amongst variables, 
#   - independent vs. dependent
#   - first dependent, bid or not 
#   - finding correlations amongst variables
#   - investigate if random forest might work as a model

options(java.parameters = "-Xmx8048m")
library(RJDBC)
library(dplyr)
library(dplyr.snowflakedb)
library(stringr)

options(dplyr.jdbc.classpath = "/Users/akshaysubramaniam/downloads/snowflake-jdbc-3.0.2.jar")
db <- src_snowflakedb(user="akshay",
                      password ="ILpockET01",
                      account = "kargo",
                      opts = list(warehouse = "RTEST",
                                  db = "KARGOTEST",
                                  schema = "public"))

#11/12
queryStmt12 = c("select",
                "date,",
                "impression_id,",
                "bid_status,",
                "uuid,",
                "records:request:referer as referer," ,
                "records:request:request_uri as request_uri," ,
                "records:request:useragent as useragent,",
                "records:supply:site:category as category,",
                "records:supply:site:domain as domain,",
                "records:supply:site:grapeshot_channel as grapeshot_channel,",
                "records:supply:site:id as site_id,",
                "records:supply:site:page as site,",
                "records:supply:krux_segment as krux_segment,",
                "records:timestamp as timestamp,",
                "records:user:agent:browser:name as browser,",
                "records:user:agent:os:name::string as os_name,",
                "records:user:agent:os:version::string as os_version,",
                "records:user:kargo_id as kargo_id,",
                "records:user:geo as geo",
                "from KARGOTEST.PUBLIC.SSP_BID_RESPONSE_EXACT ",
                "where date = '2016-11-12' and demand_bidder_deal_id in ('K-P-06f83a08','K-P-a011f049','K-P-4acb40a4','K-IND-a42f3f62','K-IND-7c4630d6','K-P-9f6a627d','K-P-00d80c0f') ")

fullQuery12 <- str_c(queryStmt12, sep="", collapse=" ")
results = dbGetQuery(db$con, fullQuery12)
tblResults12 = tbl_df(results)
rm(results)
#tblResults_11.12 <- subset(tblResults_11.12, BID_STATUS != "yes_bid")
#View(tblResults_11.12)

#11/13
queryStmt13 = c("select",
                "date,",
                "impression_id,",
                "bid_status,",
                "uuid,",
                "records:request:referer as referer," ,
                "records:request:request_uri as request_uri," ,
                "records:request:useragent as useragent,",
                "records:supply:site:category as category,",
                "records:supply:site:domain as domain,",
                "records:supply:site:grapeshot_channel as grapeshot_channel,",
                "records:supply:site:id as site_id,",
                "records:supply:site:page as site,",
                "records:supply:krux_segment as krux_segment,",
                "records:timestamp as timestamp,",
                "records:user:agent:browser:name as browser,",
                "records:user:agent:os:name::string as os_name,",
                "records:user:agent:os:version::string as os_version,",
                "records:user:kargo_id as kargo_id,",
                "records:user:geo as geo",
                "from KARGOTEST.PUBLIC.SSP_BID_RESPONSE_EXACT ",
                "where date = '2016-11-13' and demand_bidder_deal_id in ('K-P-06f83a08','K-P-a011f049','K-P-4acb40a4','K-IND-a42f3f62','K-IND-7c4630d6','K-P-9f6a627d','K-P-00d80c0f') ")

fullQuery13 <- str_c(queryStmt13, sep="", collapse=" ")
results = dbGetQuery(db$con, fullQuery13)
tblResults13 = tbl_df(results)
rm(results)
#tblResults_11.13 <- subset(tblResults_11.13, BID_STATUS != "yes_bid")
#View(tblResults_11.13)

#11/14
queryStmt14 = c("select",
                "date,",
                "impression_id,",
                "bid_status,",
                "uuid,",
                "records:request:referer as referer," ,
                "records:request:request_uri as request_uri," ,
                "records:request:useragent as useragent,",
                "records:supply:site:category as category,",
                "records:supply:site:domain as domain,",
                "records:supply:site:grapeshot_channel as grapeshot_channel,",
                "records:supply:site:id as site_id,",
                "records:supply:site:page as site,",
                "records:supply:krux_segment as krux_segment,",
                "records:timestamp as timestamp,",
                "records:user:agent:browser:name as browser,",
                "records:user:agent:os:name::string as os_name,",
                "records:user:agent:os:version::string as os_version,",
                "records:user:kargo_id as kargo_id,",
                "records:user:geo as geo",
                "from KARGOTEST.PUBLIC.SSP_BID_RESPONSE_EXACT ",
                "where date = '2016-11-14' and demand_bidder_deal_id in ('K-P-06f83a08','K-P-a011f049','K-P-4acb40a4','K-IND-a42f3f62','K-IND-7c4630d6','K-P-9f6a627d','K-P-00d80c0f') ")

fullQuery14 <- str_c(queryStmt14, sep="", collapse=" ")
results = dbGetQuery(db$con, fullQuery14)
tblResults14 = tbl_df(results)
rm(results)
#tblResults_11.14 <- subset(tblResults_11.14, BID_STATUS != "yes_bid")
#View(tblResults_11.14)

#11/15
queryStmt15 = c("select",
  "date,",
  "impression_id,",
  "bid_status,",
  "uuid,",
  "records:request:referer as referer," ,
  "records:request:request_uri as request_uri," ,
  "records:request:useragent as useragent,",
  "records:supply:site:category as category,",
  "records:supply:site:domain as domain,",
  "records:supply:site:grapeshot_channel as grapeshot_channel,",
  "records:supply:site:id as site_id,",
  "records:supply:site:page as site,",
  "records:supply:krux_segment as krux_segment,",
  "records:timestamp as timestamp,",
  "records:user:agent:browser:name as browser,",
  "records:user:agent:os:name::string as os_name,",
  "records:user:agent:os:version::string as os_version,",
  "records:user:kargo_id as kargo_id,",
  "records:user:geo as geo",
"from KARGOTEST.PUBLIC.SSP_BID_RESPONSE_EXACT ",
"where date = '2016-11-15' and demand_bidder_deal_id in ('K-P-06f83a08','K-P-a011f049','K-P-4acb40a4','K-IND-a42f3f62','K-IND-7c4630d6','K-P-9f6a627d','K-P-00d80c0f') ")

fullQuery15 <- str_c(queryStmt15, sep="", collapse=" ")
results = dbGetQuery(db$con, fullQuery15)
tblResults15 = tbl_df(results)
rm(results)
#View(tblResults15)
#head(tblResults$OS_NAME)
#filter(tblResults, `OS_NAME`=='iOS')

#No-bid data - from arbritrary dates before 11/12-11/15 because not enough data in that timeframe
queryStmtNo = c("select",
              "date,",
              "impression_id,",
              "bid_status,",
              "uuid,",
              "records:request:referer as referer," ,
              "records:request:request_uri as request_uri," ,
              "records:request:useragent as useragent,",
              "records:supply:site:category as category,",
              "records:supply:site:domain as domain,",
              "records:supply:site:grapeshot_channel as grapeshot_channel,",
              "records:supply:site:id as site_id,",
              "records:supply:site:page as site,",
              "records:supply:krux_segment as krux_segment,",
              "records:timestamp as timestamp,",
              "records:user:agent:browser:name as browser,",
              "records:user:agent:os:name::string as os_name,",
              "records:user:agent:os:version::string as os_version,",
              "records:user:kargo_id as kargo_id,",
              "records:user:geo as geo",
              "from KARGOTEST.PUBLIC.SSP_BID_RESPONSE_EXACT",
              "where demand_bidder_deal_id in ('K-P-06f83a08','K-P-a011f049','K-P-4acb40a4','K-IND-a42f3f62','K-IND-7c4630d6','K-P-9f6a627d','K-P-00d80c0f')",
              "and bid_status != 'yes_bid'",
              "limit 18000" )
fullQueryNo <- str_c(queryStmtNo, sep="", collapse=" ")
results = dbGetQuery(db$con, fullQueryNo)
noBid = tbl_df(results)
noBid$DOMAIN <- str_replace_all(noBid$DOMAIN, "\"", "")
rm(results)
#View(noBid)



#see if there's overlap between domains of yes_bid and no_bid
#inspect number of kargo IDs assigned to yes_bid vs no_Bid
#inspect number of UUIDs 
#browser? OS? 

#Response Data
queryStmtResp = c("select",
                 "records:bidder:id as bidder_id,",
                 "records:campaign:id as campaign_id,",
                 "records:creative:ad_execution as ad_execution,",
                 "records:demand_type,",
                 "records:line_item:pricing_type as pricing_type,",
                 "records:demand:line_item:id as line_item_id,",
                 "records:demand:line_item:pricint_type as line_item_pricing_type,",
                 "records:user:agent:browser:version as browser_version,",
                 "records:user:agent:os:version as os_version,",
                 "records:user:agent:os:name as os_name",
                 "from KARGOTEST.PUBLIC.SSP_BID_REQUEST_EXACT",
                 "where date in ('2016-11-12', '2016-11-13', '2016-11-14', '2016-11-15')",
                 "limit 18000")
fullQueryResp <- str_c(queryStmtResp, sep="", collapse=" ")
results = dbGetQuery(db$con, fullQueryResp)
resp = tbl_df(results)
rm(results)











