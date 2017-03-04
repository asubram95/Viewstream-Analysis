# Things you need to change:
# - classPath (change "admin" to your login name)
# - account name in the JDBC URL (change "acme" to your account name)
# - username (your username)
# - password (your password)



if (!require("RJDBC")) {
  install.packages("RJDBC",repos="http://cran.rstudio.com/")
  library("RJDBC")
}

jdbcDriver <- JDBC(driverClass="com.snowflake.client.jdbc.SnowflakeDriver",
                   classPath="path")
db <- dbConnect(jdbcDriver,
                            "jdbc:snowflake://kargo.snowflakecomputing.com:443/?account=kargo",
                            "username",
                            "password",
                            opts=list(warehouse ="RTEST",
                                      db="KARGOTEST",
                                      schema="SYSADMIN"))
result <- dbGetQuery(db, "select current_timestamp() as now, current_user() as user")
#print(result)
#dbDisconnect(jdbcConnection)
#db <- tbl(db, "CELTRA_IMPRESSION_LOG")

dbGetRowCount(db)
                      
