---
title: "Access Open Data Through the Junar API"
author: "Frans van Dunné"
date: "2017-08-08"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Access Open Data Through the Junar API}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---

## Introduction
The Junar API is the basis for a number of Open Data initiatives in Latin
America and the USA. The `junr` package is a wrapper to make it easier to
access data made public through the Junar API. Some examples of implementations
are listed on the [Junar website](http://www.junar.com/).

## Usage
As an example we will use the data from the [Costa Rican President's
Office](http://datosabiertos.presidencia.go.cr/home).The first step is to
access the website offering the open data to identify the base URL and to
obtain an API Key to get access to the Junar API that hosts the data. You will
find both on the [developers page of the Open Data Costa Rica
site](http://datosabiertos.presidencia.go.cr/developers/). 

Below we use a test API Key so that all the examples will run. You may want to
get your own API Key instead to run the examples below. Note that with Junar
each URL has its own API key.


```r
library(junr)
base_url <- "http://api.datosabiertos.presidencia.go.cr/api/v2/datastreams/"
api_key <- "0bd55e858409eefabc629b28b2e7916361ef20ff" 
```

Now that we have the basic information for a connection we can quickly check
what data is available behind this URL.


```r
get_index(base_url, api_key)
```

The `get_index`function returns the complete list of available data with all
meta-data included as a data frame. 

To get only a list of the global unique identifiers (GUID) of the data sets,
you can use `list_guid`. 


```r
list_guid(base_url, api_key)
```

```
##   [1] "LLEGA-INTER-A-COSTA-RICA"     "CRECI-DEL-PIB"               
##   [3] "IPC"                          "LICIT-ADJUD-POR-LAS-INSTI"   
##   [5] "LICIT-ADJUD-POR-LOS-MINIS"    "LICIT-ADJUD-POR-LAS-81483"   
##   [7] "MAYO-2017-PRESI-DE-LA"        "MAYO-2017-MINIS-DE-LA"       
##   [9] "ABRIL-2017-PRESI-DE-LA"       "ABRIL-2017-MINIS-DE-LA"      
##  [11] "NOVIE-2016-MINIS-DE-90677"    "NOVIE-2016-SALAR-PRESI-DE"   
##  [13] "COMPR-PUBLI-DE-PRESI-Y"       "BASE-DE-DATOS-RNT"           
##  [15] "PRUEB"                        "MARZO-2017-SALAR-MINIS-DE"   
##  [17] "OCTUB-2016-SALAR-MINIS-DE"    "OCTUB-2016-SALAR-PRESI-65964"
##  [19] "OCTUB-2016-SALAR-PRESI-65743" "021-OCTUB-16"                
##  [21] "ENERO-2017-SALAR-PRESI-DE"    "ENERO-2017-SALAR-MINIS-DE"   
##  [23] "DICIE-2016-SALAR-MINIS-DE"    "DICIE-2016-PLANI-PRESI-84096"
##  [25] "OCTUB-2016-SALAR-PRESI-DE"    "MINIS-DE-OBRAS-PUBLI-97637"  
##  [27] "MINIS-DE-SEGUR-PUBLI-2014"    "MINIS-DE-PLANI-NACIO-2014"   
##  [29] "MINIS-DE-EDUCA-PUBLI-67848"   "MINIS-DE-EDUCA-PUBLI-93512"  
##  [31] "DIREC-GENER-DE-MIGRA-Y"       "DIREC-NACIO-DE-NOTAR-59323"  
##  [33] "MINIS-DE-GOBER-Y-POLIC"       "IMPRE-NACIO-2014-2016"       
##  [35] "INSTI-COSTA-DE-TURIS-2014"    "MINIS-DE-RELAC-EXTER-Y"      
##  [37] "MINIS-DE-EDUCA-PUBLI-2014"    "INSTI-NACIO-DE-TRANS-AGROP"  
##  [39] "DIREC-NACIO-DE-NOTAR-2014"    "CONSO-DE-VIAJE-AL-EXTER"     
##  [41] "SETIE-2016-SALAR-MINIS-PRESI" "SETIE-2016-PRESI-DE-LA"      
##  [43] "AGOST-2016-MINIS-DE-LA"       "AGOST-2016-SALAR-PRESI-DE"   
##  [45] "SERVI-NACIO-DE-SALUD-ANIMA"   "SERVI-FITOS-DEL-ESTAD-2015"  
##  [47] "MINIS-DE-OBRAS-PUBLI-Y"       "MINIS-DE-HACIE-2015"         
##  [49] "IMPRE-NACIO-2015"             "MINIS-DE-EDUCA-PUBLI-2015"   
##  [51] "MINIS-DE-CIENC-TECNO-Y"       "MINIS-DE-AGRIC-Y-GANAD"      
##  [53] "INSTI-NACIO-DE-TURIS-2015"    "DIREC-DE-MIGRA-Y-EXTRA"      
##  [55] "CUMPL-DE-INFOR-DE-87487"      "CUMPL-DE-INFOR-DE-14097"     
##  [57] "CUMPL-DE-INFOR-DE-14456"      "CUMPL-DE-INFOR-DE-14478"     
##  [59] "CUMPL-DE-INFOR-DE-26552"      "AYA-EVALU-POI-PROGR-02"      
##  [61] "AYA-EVALU-POI-I-TRIME"        "AYA-INFOR-DE-EJECU-PRESU"    
##  [63] "AYA-SALAR-ENERO-2016"         "AYA-CONTR-ADJUD-EN-FIRME"    
##  [65] "CUMPL-DE-AUDIT-MINIS-61945"   "CUMPL-DE-INFOR-MINIS-DE"     
##  [67] "CUMPL-DE-INFOR-SENAS"         "CUMPL-DE-AUDIT-MINIS-DE"     
##  [69] "CUMPL-DE-AUDIT-COMEX"         "MATRI-DE-CUMPL-DE-43076"     
##  [71] "MATRI-DE-CUMPL-DE-AUDIT"      "CUMPL-DE-INFOR-DE-40516"     
##  [73] "ABRIL-2016-SALAR-MINIS-DE"    "JUNIO-2016-SALAR-MINIS-23346"
##  [75] "JULIO-2016-SALAR-PRESI-DE"    "JUNIO-2016-SALAR-PRESI-DE"   
##  [77] "MAYO-2015-SALAR-PRESI-DE"     "JULIO-2016-MINIS-DE-LA"      
##  [79] "JUNIO-2016-SALAR-MINIS-DE"    "MAYO-2016-SALAR-MINIS-DE"    
##  [81] "ABRIL-2016-SALAR-DEL-MINIS"   "ABRIL-2016-SALAR-PRESI-DE"   
##  [83] "CUMPL-DE-INFOR-DE-75676"      "CUMPL-DE-INFOR-DE-AUDIT"     
##  [85] "INFOR-CUMPL-DE-AUDIT-97747"   "INFOR-CUMPL-DE-AUDIT-43518"  
##  [87] "INFOR-CUMPL-DE-AUDIT-36700"   "INFOR-CUMPL-DE-AUDIT-INTER"  
##  [89] "DATOS-CORRE-AL-PAGO-DE"       "JUNIO-2016-PLANI-DE-PRESI"   
##  [91] "JUNIO-2016-SALAR-DE-PRESI"    "AYA-GASTO-DE-VIAJE-AL"       
##  [93] "INFOR-DE-HORAS-EXTRA-01"      "INFOR-DE-HORAS-EXTRA-67320"  
##  [95] "INFOR-DE-HORAS-EXTRA-7"       "VISTA"                       
##  [97] "PLANI-DE-SALAR-PRESI-DE"      "COMPR-PUBLI-DE-PRESI"        
##  [99] "COMPR-PUBLI-DEL-MINIS"        "DESCR-DE-ABREV-DE-LAS"       
## [101] "EJECU-DE-PRESU-DE-50724"      "EJECU-DE-PRESU-DE-INSTI"     
## [103] "LICIT-ADJUD-DE-LAS-INSTI"     "PLANI-DEL-MINIS"
```

You can also make a list of the titles of the data sets:


```r
list_titles(base_url, api_key)
```

```
##   [1] "Llegadas Internacionales a Costa Rica"                                           
##   [2] "Crecimiento del PIB"                                                             
##   [3] "IPC"                                                                             
##   [4] "Licitaciones adjudicadas por las Instituciones Públicas según año"               
##   [5] "Licitaciones adjudicadas por los Ministerios"                                    
##   [6] "Licitaciones adjudicadas por las Instituciones Públicas según tipo de trámite"   
##   [7] "Mayo 2017 - Presidencia de la República"                                         
##   [8] "Mayo 2017 - Ministerio de la Presidencia"                                        
##   [9] "Abril 2017 - Presidencia de la República"                                        
##  [10] "Abril 2017 - Ministerio de la Presidencia"                                       
##  [11] "Noviembre 2016 - Ministerio de la Presidencia"                                   
##  [12] "Noviembre 2016 - Salarios Presidencia de la República"                           
##  [13] "Compras públicas de Presidencia y el Ministerio de la Presidencia"               
##  [14] "Base de datos RNT"                                                               
##  [15] "PRUEBA1"                                                                         
##  [16] "Marzo 2017 - Salarios Ministerio de la Presidencia"                              
##  [17] "Octubre 2016 - Salarios Ministerio de la Presidencia"                            
##  [18] "Octubre 2016 - Salarios Presidencia de la República"                             
##  [19] "Octubre 2016 - Salarios Presidencia de la República"                             
##  [20] "Octubre 2016 - Salarios Presidencia de la República"                             
##  [21] "Enero 2017 - Salarios Presidencia de la República"                               
##  [22] "Enero 2017 - Salarios Ministerio de la Presidencia"                              
##  [23] "Diciembre 2016 - Salario Ministerio de la Presidencia"                           
##  [24] "Diciembre 2016 - Planilla Presidencia de la República"                           
##  [25] "Octubre 2016 - Salarios Presidencia de la República"                             
##  [26] "Ministerio de Obras Públicas y Transporte (2014-2016)"                           
##  [27] "Ministerio de Seguridad Pública (2014-2016)"                                     
##  [28] "Ministerio de Planificación Nacional (2014-2016)"                                
##  [29] "Ministerio de Educación Pública (2014-2016)"                                     
##  [30] "Ministerio de Educación Pública (2014-2016)"                                     
##  [31] "Dirección General de Migración y Extranjería (2014 - 2016)"                      
##  [32] "DINADECO (2014 - 2018)"                                                          
##  [33] "Ministerio de Gobernación y Policía (2014-2016)"                                 
##  [34] "Imprenta Nacional 2014-2016"                                                     
##  [35] "Instituto Costarricense de Turismo - (2014-2016)"                                
##  [36] "Ministerio de Relaciones Exteriores y Culto"                                     
##  [37] "Ministerio de Educación Pública (2014-2016)"                                     
##  [38] "Instituto Nacional de Transferencia Agropecuaria (2014-2016)"                    
##  [39] "Dirección Nacional de Notariado (2014-2016)"                                     
##  [40] "Consolidado de viajes al exterior"                                               
##  [41] "Setiembre 2016 - Salarios Ministerio Presidencia"                                
##  [42] "Setiembre 2016 - Presidencia de la República"                                    
##  [43] "Agosto 2016 - Ministerio de la Presidencia"                                      
##  [44] "Agosto 2016 - Salarios Presidencia de la República"                              
##  [45] "Servicio Nacional de Salud Animal SENASA (2015)"                                 
##  [46] "Servicio Fitosanitario del Estado (2015)"                                        
##  [47] "Ministerio de Obras Públicas y Transportes (2015)"                               
##  [48] "Ministerio de Hacienda (2015)"                                                   
##  [49] "Imprenta Nacional (2015)"                                                        
##  [50] "Ministerio de Educación Pública (2015)"                                          
##  [51] "Ministerio de Ciencia, Tecnología y Telecomunicaciones (2015)"                   
##  [52] "Ministerio de Agricultura y Ganadería (2015)"                                    
##  [53] "Instituto Nacional de Turismo (2015)"                                            
##  [54] "Dirección de Migración y Extranjería - 2015"                                     
##  [55] "Cumplimiento de Informe de Auditoría Interna - DINADECO"                         
##  [56] "Cumplimiento de Informe de Auditoría Interna - DNN"                              
##  [57] "Cumplimiento de Informe de Auditoría Interna - MINAE"                            
##  [58] "Cumplimiento de Informe de Auditoría Interna - Ministerio de Hacienda"           
##  [59] "Cumplimiento de Informe de Auditoría Interna - MIVAH"                            
##  [60] "AYA - Evaluación POI - Programa 02  ASADAS - I Trimestre 2016"                   
##  [61] "AYA - Evaluación POI - Programa 02 - I Trimestre 2016"                           
##  [62] "AYA - Informe de ejecución presupuestario consolidado (I T-2016)"                
##  [63] "AYA - Salarios Enero 2016"                                                       
##  [64] "AyA - Contrataciones adjudicadas en firme"                                       
##  [65] "Cumplimiento de auditoría - Ministerio de Gobernación y Policía"                 
##  [66] "Cumplimiento de auditoría - Ministerio de Relaciones Exteriores"                 
##  [67] "Cumplimiento de auditoría  - SENASA"                                             
##  [68] "Cumplimiento de auditoría - Ministerio de la Presidencia"                        
##  [69] "Cumplimiento de auditoría - COMEX"                                               
##  [70] "Cumplimiento de auditoría - Imprenta Nacional"                                   
##  [71] "Cumplimiento de auditoría - Dirección General de Migración y Extranjer"          
##  [72] "Cumplimiento de Informe de Auditoría Interna - SFE"                              
##  [73] "Abril 2016 - Salarios Ministerio de la Presidencia"                              
##  [74] "Junio 2016 - Salarios Ministerio de la Presidencia"                              
##  [75] "Julio 2016 - Salarios Presidencia de la República"                               
##  [76] "Junio 2016 - Salarios Presidencia de la República"                               
##  [77] "Mayo 2016 - Salarios Presidencia de la República"                                
##  [78] "Julio 2016 - Ministerio de la Presidencia"                                       
##  [79] "Junio 2016 - Salarios Ministerio de la Presidencia"                              
##  [80] "Mayo 2016 - Salarios Ministerio de la Presidencia"                               
##  [81] "Abril 2016 - Salarios del Ministerio de la Presidencia"                          
##  [82] "Abril 2016 - Salarios Presidencia de la República"                               
##  [83] "Cumplimiento de Informe de Auditoría Interna - Salud"                            
##  [84] "Cumplimiento de informes de auditoría interna - MAG"                             
##  [85] "Cumplimiento de Informes de Auditoría Interna - ICT"                             
##  [86] "Cumplimiento de Informe de Auditoría Interna - MOPT"                             
##  [87] "Cumplimiento de Informes de Auditoría Interna - Ministerio de RREE"              
##  [88] "Cumplimiento de Informe de Auditoría Interna - SENASA"                           
##  [89] "Octubre 2015: Planilla de Salarios: Presidencia de la República"                 
##  [90] "JUNIO 2016 - Planilla de Presidencia de la República"                            
##  [91] "Junio 2016 - Salarios de Presidencia de la República"                            
##  [92] "AyA. Gastos de viajes al exterior Mayo 2014 - Abril 2015"                        
##  [93] "Informe de Horas Extra: 01 de enero 2015 al 31 de diciembre de 2015"             
##  [94] "Informe de Horas Extra: 01 de enero 2015 al 31 de diciembre de 2015"             
##  [95] "Informe de Horas Extra: 7 de mayo 2014 al 31 de diciembre 2014."                 
##  [96] "Informe de Horas Extra: 01 de enero 2016 al 30 de abril 2016"                    
##  [97] "Abril 2016: Planilla de Salarios Presidencia de la República"                    
##  [98] "Compras públicas de Presidencia"                                                 
##  [99] "Compras públicas del Ministerio de la Presidencia"                               
## [100] "Descripción de abreviaturas de las ejecuciones "                                 
## [101] "Ejecución de presupuesto de Instituciones para el 2014"                          
## [102] "Ejecución de presupuesto de Instituciones para el 2015"                          
## [103] "Licitaciones Adjudicadas de las Instituciones Públicas para el período 2014-2015"
## [104] "Ministerio de la Presidencia"
```

Both `list_guid` and `list_titles` where set up for convenience only because
the results tend to fit in the console window making it easier to read. They
are meant to help to get a quick overview of the available data.

## Downloading data to R
You need to know the Global Unique Identifier (GUID) of the data set that you
are interested in to be able to download them to your R session. You can look
for the GUID on the web page that shows the data of interest. For example on the
page for [public expenditure of the Costa Rican
government](http://datosabiertos.presidencia.go.cr/dashboards/9566/compras-publicas/)
there is a table called "Public Purchasing of the Ministry of the Presidency".
In the menu underneath the table you have an option to "Obtain GUID". This last
option opens a pop-up showing the GUID "COMPR-PUBLI-DEL-MINIS" that we are
going to use in the example below.


```r
data_guid <- "COMPR-PUBLI-DEL-MINIS"
purchasing_data <- get_data(base_url, api_key, data_guid)
```

With `View(purchasing_data)` you can check whether the data have been
downloaded correctly, and have a quick visual check on the mode of the data
(see below to convert currency data from text to numeric).

You may note that if you do not need to go to the web interface to get the GUID
for any data sets of interest. With the function `list_guid()` as we used it
above, we obtained the same information. 


```r
pres_list <-list_guid(base_url, api_key)
pres_list[3]
```

```
## [1] "IPC"
```

We can get the GUID we are interested in by fetching the third entry in the
list of GUID's (see the full list in the example above). And the same index
numbers can be used with a list of full titles created  with `list_titles()`. 

## Determine data dimensions
On data platforms that run Junar, many data sets are just tables of data that
has already been analyzed and summarized. It is not immediately obvious which
sets contain many data points, and which sets contain only a few rows.

The function `get_dimensions` will download all data sets offered through the
base URL and determine how many rows and columns are available in each one. It
is useful to make a quick assessment of the data available. However, please
note that it may take a while before the function finishes, especially if there
are many GUID's.



```r
get_dimensions(base_url, api_key)
```

```
## Warning in doTryCatch(return(expr), name, parentenv, handler): NAs
## introduced by coercion

## Warning in doTryCatch(return(expr), name, parentenv, handler): NAs
## introduced by coercion

## Warning in doTryCatch(return(expr), name, parentenv, handler): NAs
## introduced by coercion
```

```
##                             GUID NROW NCOL   DIM
## 2       LLEGA-INTER-A-COSTA-RICA    9    5    45
## 21                 CRECI-DEL-PIB   55    6   330
## 3                            IPC   38    7   266
## 4      LICIT-ADJUD-POR-LAS-INSTI    3    2     6
## 5      LICIT-ADJUD-POR-LOS-MINIS   10    2    20
## 6      LICIT-ADJUD-POR-LAS-81483    7    2    14
## 7          MAYO-2017-PRESI-DE-LA  999    6  5994
## 8          MAYO-2017-MINIS-DE-LA  760    6  4560
## 9         ABRIL-2017-PRESI-DE-LA  999    6  5994
## 10        ABRIL-2017-MINIS-DE-LA  764    6  4584
## 11     NOVIE-2016-MINIS-DE-90677   NA   NA    NA
## 12     NOVIE-2016-SALAR-PRESI-DE  999    6  5994
## 13        COMPR-PUBLI-DE-PRESI-Y  217    9  1953
## 14             BASE-DE-DATOS-RNT  999   20 19980
## 15                         PRUEB   57    6   342
## 16     MARZO-2017-SALAR-MINIS-DE  772    6  4632
## 17     OCTUB-2016-SALAR-MINIS-DE  999   18 17982
## 18  OCTUB-2016-SALAR-PRESI-65964  999    6  5994
## 19  OCTUB-2016-SALAR-PRESI-65743  999    6  5994
## 20                  021-OCTUB-16  999    6  5994
## 211    ENERO-2017-SALAR-PRESI-DE  999    6  5994
## 22     ENERO-2017-SALAR-MINIS-DE  885    6  5310
## 23     DICIE-2016-SALAR-MINIS-DE  777    6  4662
## 24  DICIE-2016-PLANI-PRESI-84096  999    6  5994
## 25     OCTUB-2016-SALAR-PRESI-DE  999    6  5994
## 26    MINIS-DE-OBRAS-PUBLI-97637  999   15 14985
## 27     MINIS-DE-SEGUR-PUBLI-2014  620   15  9300
## 28     MINIS-DE-PLANI-NACIO-2014  312   13  4056
## 29    MINIS-DE-EDUCA-PUBLI-67848  808   15 12120
## 30    MINIS-DE-EDUCA-PUBLI-93512  808   15 12120
## 31        DIREC-GENER-DE-MIGRA-Y   61   15   915
## 32    DIREC-NACIO-DE-NOTAR-59323   61   15   915
## 33        MINIS-DE-GOBER-Y-POLIC   47   14   658
## 34         IMPRE-NACIO-2014-2016  406   15  6090
## 35     INSTI-COSTA-DE-TURIS-2014  291   15  4365
## 36        MINIS-DE-RELAC-EXTER-Y   92   15  1380
## 37     MINIS-DE-EDUCA-PUBLI-2014  675   15 10125
## 38    INSTI-NACIO-DE-TRANS-AGROP   20   15   300
## 39     DIREC-NACIO-DE-NOTAR-2014   18   14   252
## 40       CONSO-DE-VIAJE-AL-EXTER  327   14  4578
## 41  SETIE-2016-SALAR-MINIS-PRESI   99    6   594
## 42        SETIE-2016-PRESI-DE-LA   99    6   594
## 43        AGOST-2016-MINIS-DE-LA  739    6  4434
## 44     AGOST-2016-SALAR-PRESI-DE    0    6     0
## 45    SERVI-NACIO-DE-SALUD-ANIMA   16   15   240
## 46    SERVI-FITOS-DEL-ESTAD-2015    0   15     0
## 47        MINIS-DE-OBRAS-PUBLI-Y  614   15  9210
## 48           MINIS-DE-HACIE-2015   51   15   765
## 49              IMPRE-NACIO-2015   95   14  1330
## 50     MINIS-DE-EDUCA-PUBLI-2015  278   15  4170
## 51        MINIS-DE-CIENC-TECNO-Y   13   15   195
## 52        MINIS-DE-AGRIC-Y-GANAD   20   15   300
## 53     INSTI-NACIO-DE-TURIS-2015   24   15   360
## 54        DIREC-DE-MIGRA-Y-EXTRA   32   15   480
## 55       CUMPL-DE-INFOR-DE-87487   16   63  1008
## 56       CUMPL-DE-INFOR-DE-14097   12   63   756
## 57       CUMPL-DE-INFOR-DE-14456   87   14  1218
## 58       CUMPL-DE-INFOR-DE-14478   58   14   812
## 59       CUMPL-DE-INFOR-DE-26552   13   14   182
## 60        AYA-EVALU-POI-PROGR-02    6   11    66
## 61         AYA-EVALU-POI-I-TRIME    6   12    72
## 62      AYA-INFOR-DE-EJECU-PRESU  204   10  2040
## 63          AYA-SALAR-ENERO-2016  999   10  9990
## 64      AYA-CONTR-ADJUD-EN-FIRME  284    4  1136
## 65    CUMPL-DE-AUDIT-MINIS-61945    4   15    60
## 66       CUMPL-DE-INFOR-MINIS-DE   31   63  1953
## 67          CUMPL-DE-INFOR-SENAS   16   14   224
## 68       CUMPL-DE-AUDIT-MINIS-DE   23   14   322
## 69          CUMPL-DE-AUDIT-COMEX   12   14   168
## 70       MATRI-DE-CUMPL-DE-43076   95   14  1330
## 71       MATRI-DE-CUMPL-DE-AUDIT    1   14    14
## 72       CUMPL-DE-INFOR-DE-40516  312   14  4368
## 73     ABRIL-2016-SALAR-MINIS-DE  999    8  7992
## 74  JUNIO-2016-SALAR-MINIS-23346  768    6  4608
## 75     JULIO-2016-SALAR-PRESI-DE  999    6  5994
## 76     JUNIO-2016-SALAR-PRESI-DE  999    6  5994
## 77      MAYO-2015-SALAR-PRESI-DE  999    6  5994
## 78        JULIO-2016-MINIS-DE-LA  768    6  4608
## 79     JUNIO-2016-SALAR-MINIS-DE  768    6  4608
## 80      MAYO-2016-SALAR-MINIS-DE  768    6  4608
## 81    ABRIL-2016-SALAR-DEL-MINIS  999    8  7992
## 82     ABRIL-2016-SALAR-PRESI-DE  999   13 12987
## 83       CUMPL-DE-INFOR-DE-75676   21   15   315
## 84       CUMPL-DE-INFOR-DE-AUDIT   25   14   350
## 85    INFOR-CUMPL-DE-AUDIT-97747   21   15   315
## 86    INFOR-CUMPL-DE-AUDIT-43518  131   14  1834
## 87    INFOR-CUMPL-DE-AUDIT-36700   42   14   588
## 88    INFOR-CUMPL-DE-AUDIT-INTER   15   14   210
## 89        DATOS-CORRE-AL-PAGO-DE  999   10  9990
## 90     JUNIO-2016-PLANI-DE-PRESI    0   15     0
## 91     JUNIO-2016-SALAR-DE-PRESI  321   15  4815
## 92         AYA-GASTO-DE-VIAJE-AL   13    4    52
## 93       INFOR-DE-HORAS-EXTRA-01  386    7  2702
## 94    INFOR-DE-HORAS-EXTRA-67320  386    7  2702
## 95        INFOR-DE-HORAS-EXTRA-7  182    7  1274
## 96                         VISTA  386    8  3088
## 97       PLANI-DE-SALAR-PRESI-DE  999   13 12987
## 98          COMPR-PUBLI-DE-PRESI  427    4  1708
## 99         COMPR-PUBLI-DEL-MINIS  324    4  1296
## 100        DESCR-DE-ABREV-DE-LAS   27    4   108
## 101      EJECU-DE-PRESU-DE-50724  999   40 39960
## 102      EJECU-DE-PRESU-DE-INSTI  999   39 38961
## 103     LICIT-ADJUD-DE-LAS-INSTI  999    7  6993
## 104              PLANI-DEL-MINIS  999    8  7992
```

## Clean up currency data
In the example data above, and possibly in more Junar implementations, we need
to clean up any data related to currency values. In our case we need to found
all currency symbols (Costa Rica Colon) and all the comma's separating
thousands. As they stand these values are text strings, and cannot be converted
directly to numeric without removing the symbols and commas.

There are two utilities to help cleaning the currency data: `clean_currency`
and `get_currency_symbol`.  For example:


```r
currency_data <- get_data(base_url, api_key, "LICIT-ADJUD-POR-LOS-MINIS")
currency_data$`Monto Adjudicado` <- clean_currency(currency_data$`Monto Adjudicado`)  
```
