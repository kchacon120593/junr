[![Travis-CI Build Status](https://travis-ci.org/FvD/junr.svg?branch=master)](https://travis-ci.org/FvD/junr) 
[![Coverage Status](https://img.shields.io/codecov/c/github/FvD/junr/master.svg)](https://codecov.io/github/FvD/junr?branch=master)

# Access Open Data with the Junar API

The primary audience for this package is likely to have Spanish as their first language, and so we introduce the package in Spanish below. However, the package itself is written in English (for eventual submission to CRAN) and an introduction in English is available in the [vignette]().

## Instalacion

## Use

See the [vignette]()

# Accede Datos Abiertos con el API de Junar

El paquete `junr` envuelve al API de Junar para facilitar el acceso a los datos disponibles desde R. El objetivo es fomentar el uso de los datos disponibles haciendo el acceso mas facil.

Es posible usar el paquete para tener listados de los datos disponibles y despues exportarlos a Excel. Pero, recomendamos usar R para visualizar y analisar los datos. 

## Instalación


## Uso 
Como ejemplo vamos a usar los datos de la casa presidencial costa ricense. Lo primero es ir al sitio correspondiente para encontrar el URL base (`base_url`) y obtener un *token* para el API de Junar.

Por ejemplo:

```
library(junr)
url_base <- "http://api.datosabiertos.presidencia.go.cr/api/v2/datastreams/"
token_api <- "2ac5dbd5b269c1c4937e77a4bc14169c738be8ab"

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
