[![Travis-CI Build Status](https://travis-ci.org/FvD/junr.svg?branch=master)](https://travis-ci.org/FvD/junr) 
[![Coverage Status](https://img.shields.io/codecov/c/github/FvD/junr/master.svg)](https://codecov.io/github/FvD/junr?branch=master)

# Access Open Data with the Junar API

The junr package is a wrapper for the Junar API.

```{r}
source("apitoken.R")
```
The junar API is a common interface used in 

```{r}
library(junr)
library(httr)
library(jsonlite)
```

```{r}
junar_host <- "http://api.datosabiertos.presidencia.go.cr/api/v2/datastreams/"
data_guuid <- "COMPR-PUBLI-DEL-MINIS"

r <- GET(paste(junar_host, "?auth_key=", api_token, sep=""), accept_json())

content(r, "parsed")
cat(content(r, "text"), "\n")

content_index <- fromJSON(content(r, "text"))
content_index$guuid

url_content <- getURL(paste(junar_host, "?auth_key=", api_token, sep=""))
```

```{r}
api_token="f4d49a53040c119ff92e7b29fe028e7156de7ee2"
junar_host <- "http://micit.cloudapi.junar.com/api/v2/dashboards"
r <- GET(paste(junar_host, "?auth_key=", api_token, sep=""), accept_json())
fromJSON(content(r, "text"))

```
http://api.datosabiertos.presidencia.go.cr/api/v2/datastreams/INVER-EN-ACT-POR-TIPO/data.json/?auth_key=baa64628b1dc28a72cf8e701da65fd9afed81d01

http://api.datosabiertos.presidencia.go.cr/api/v2/datastreams/COMPR-PUBLI-DEL-MINIS/data.json/?auth_key=baa64628b1dc28a72cf8e701da65fd9afed81d01
