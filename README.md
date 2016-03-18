[![Travis-CI Build Status](https://travis-ci.org/FvD/junr.svg?branch=master)](https://travis-ci.org/FvD/junr) 
[![Coverage Status](https://img.shields.io/codecov/c/github/FvD/junr/master.svg)](https://codecov.io/github/FvD/junr?branch=master)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/junr)](http://cran.r-project.org/package=junr)

# junr

## Access Junar API data in R 

The Junar API is the basis for a number of Open Data initiatives in Latin America and the USA. 
The `junr` package is a wrapper to make it easier to acces data 
made public through the Junar API. Some examples of implementations are: [the City of Pasadena](http://data.cityofpasadena.net/home/), and [the City of San Jose](http://data.sanjoseca.gov/home/). Others are listed on the [Junar website](http://junar.com/?lang=en).

### Instalacion

    install.packages("devtools")
    devtools::install_github("FvD/junr")

## Accede Datos del API de Junar en R

El API de Junar es la base para varas inicativas de Datos Abiertos en Latino America y los EEUU. 
El paquete `junr` facilita el acceso a estos datos des R. El objetivo es fomentar el uso de los datos disponibles
haciendo el acceso lo mas fácil. Algunos ejemplos de implementaciones son: [el Portal de Datos Abiertos del Gobierno de Costa Rica](http://datosabiertos.presidencia.go.cr/home), [Chile Transparente](http://infodatos.opendata.junar.com/home/?lang=es) y la [Ciudad de Cordoba (Argentina)](http://cdcordoba.opendata.junar.com/home/?lang=en) entre otros.

### Instalación
Para instalar este paquete desde Github es necesario tener el paquete
`devtools` instalado:

    install.packages("devtools")
    devtools::install_github("FvD/junr")

Por favor tome en cuenta que este paquete esta bajo desarrollo activo. Para
actualizar la versión instalada es necesario repetir los pasos arriba.

### Uso 
Como ejemplo vamos a usar los [datos de la casa presidencial de Costa Rica](http://datosabiertos.presidencia.go.cr/home). Lo
primero es ir al sitio correspondiente para encontrar el URL base (`base_url`)
y obtener un *token* para el API de Junar el [la página de Datos Abiertos Costa Rica](http://datosabiertos.presidencia.go.cr/developers/) (se llama el "API Key" en la pagina").

    library(junr)
    url_base <- "http://api.datosabiertos.presidencia.go.cr/api/v2/datastreams/"
    token_api <- "El API Key que obtuviste de la pagina"

Miremos primero cuales datos hay disponibles en este URL:

    get_index(url_base, token_api)

Este indice es la lista completa con todos los meta-datos incluidos como un `data frame` en R. 

Para tener solo una lista de los GUID la instrucción es:

    guid_list(url_base, token_api)

Y solo un listado de los titulos 

    guid_titles(url_base, token_api)

Estas dos anteriores ayudan para tener una sobrevista rápida de los datos que
hay disponibles.

Obviamente, si conces el GUID de interes lo puedes usar directamente para
obtener los datos. Por ejemplo para los datos de la presidencia Costarricense:

    guid_datos <- "COMPR-PUBLI-DEL-MINIS"
    datos_compras <- get_data(url_base, token_api, guid_datos)
    View(datos_compras)

Con `View(datos_compras) podras comprobar que los datos han sido bajado desde
la plataforma Junar y han sido convertidos a un data frame en R.

## Plan de desarrollo

Esta es una versión preliminar y aprecio cualquier comentario. Si tienes ideas sobre funcionalidad que puede ser útil incluir en este paquete por favor abre un tiquete. En mi lista de que-haceres esta por lo menos lo siguiente:

- [] Determinar la disponibilidad de datos detras de un url_base
- [] Convertir datos de valuta a numeros (en el caso de Costa Rica valores son
  representados como TEXT y requiren conversión para analisis numérico) 

