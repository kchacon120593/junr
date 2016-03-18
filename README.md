[![Travis-CI Build Status](https://travis-ci.org/FvD/junr.svg?branch=master)](https://travis-ci.org/FvD/junr) 
[![Coverage Status](https://img.shields.io/codecov/c/github/FvD/junr/master.svg)](https://codecov.io/github/FvD/junr?branch=master)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/junr)](http://cran.r-project.org/package=junr)

# Access Open Data with the Junar API

The `junr` package is a wrapper to make it easier to acces (open) data that is
offered with the Junar API. The Junar platform is a popular API for the
presentation of Open Data by Latin American governments.

## Instalacion

    install.packages("devtools")
    devtools::install_github("fvd/junr")

## Use

For a full description with examples in english [please look at this rpub]().

# Accede Datos Abiertos con el API de Junar

El paquete `junr` envuelve al API de Junar para facilitar el acceso a los datos
disponibles desde R. El objetivo es fomentar el uso de los datos disponibles
haciendo el acceso mas facil. El API de Junar es popular en la presentación de
Datos Abiertos en Latino America.

Es posible usar el paquete para tener listados de los datos disponibles y
despues exportarlos a Excel. Pero, recomendamos usar R para visualizar y
analisar los datos. 

## Instalación
Para instalar este paquete desde Github es necesario tener el paquete
`devtools` instalado:

    install.packages("devtools")
    devtools::install_github("fvd/junr")

Por favor tome en cuenta que este paquete esta bajo desarrollo activo. Para
actualizar la version instalada es necesario repetir los pasos arriba.

## Uso 
Como ejemplo vamos a usar los [datos de la casa presidencial de Costa Rica](http://datosabiertos.presidencia.go.cr/home). Lo
primero es ir al sitio correspondiente para encontrar el URL base (`base_url`)
y obtener un *token* para el API de Junar (posiblemente el token usado en el
ejemplo aqui abajo ya no funciona, obten uno nuevo y cambialo al correr el
ejemplo).

```
library(junr)
url_base <- "http://api.datosabiertos.presidencia.go.cr/api/v2/datastreams/"
token_api <- "2ac5dbd5b269c1c4937e77a4bc14169c738be8ab"

```

Miremo primero cuales datos hay disponibles en este URL:

````
get_index(url_base, token_api)
```

Esta es la lista disponible en esta pagina. Pero tambien podemos poner el
nombre del GUID directamente en el codigo. Para obtener los datos por ejemplo:

```
guid_datos <- "COMPR-PUBLI-DEL-MINIS"
datos_compras <- get_data(url_base, token_api, guid_datos)
View(datos_compras)
```

Con `View(datos_compras) podras comprobar que los datos han sido bajado desde
la plataforma Junar y han sido convertidos a un data frame en R.

# Plan de desarrollo

Si tienes ideas para incluir en este paquete por favor abre un tiquete. Creo
que puede ser util incorporar por lo siguiente:

- Determinar la disponibilidad de datos detras de un url_base
- Convertir datos de valuta a numeros 
