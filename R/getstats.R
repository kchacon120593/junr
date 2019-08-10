#' @import httr
#' @import jsonlite
#'
NULL


#' Get hits to datastream
#'
#' Get a list of hits to the datastream
#'
#' @param base_url The base URL of the Junar service
#' @param api_key The user's API key for the Junar service
#' @export
 get_statsDS <- function(base_url, api_key){
   if (missing(base_url)) {
     warning("Please add a valid base URL")
   } else if (missing(api_key)) {
     warning(
       "Please add a valid API key for the base URL you are trying to access"
     )
   } else
     try({
       r <- GET(paste(base_url, "?auth_key=", api_key, sep=""), accept_json())
       dataset <- fromJSON(content(r, "text"))
       dataset <- dataset$datastream$stats$resources
       df <- as.data.frame(dataset)
       colnames(df) <- dataset[1,]
       df <- df [-1,]
       return(dataset)
     })
 }


#' Get hits to visualizations
#'
#' Get a list of hits to visualizations
#'
#' @param base_url The base URL of the Junar service
#' @param api_key The user's API key for the Junar service
#' @export
 get_statsVZ <- function(base_url, api_key){
   if (missing(base_url)) {
     warning("Please add a valid base URL")
   } else if (missing(api_key)) {
     warning(
       "Please add a valid API key for the base URL you are trying to access"
     )
   } else
     try({
       r <- GET(paste(base_url, "?auth_key=", api_key, sep=""), accept_json())
       dataset <- fromJSON(content(r, "text"))
       dataset <- dataset$visualizations$stats$resources
       df <- as.data.frame(dataset)
       colnames(df) <- dataset[1,]
       df <- df [-1,]
       return(dataset)
     })
}

#' Get hits to dashboards
#'
#' Get a list of hits to dashboards
#'
#' @param base_url The base URL of the Junar service
#' @param api_key The user's API key for the Junar service
#' @export
get_statsDB <- function(base_url, api_key){
   if (missing(base_url)) {
     warning("Please add a valid base URL")
   } else if (missing(api_key)) {
     warning(
       "Please add a valid API key for the base URL you are trying to access"
     )
   } else
     try({
       r <- GET(paste(base_url, "?auth_key=", api_key, sep=""), accept_json())
       dataset <- fromJSON(content(r, "text"))
       dataset <- dataset$dashboards$stats$resources

       df <- as.data.frame(dataset)
       colnames(df) <- dataset[1,]
       df <- df [-1,]

       return(dataset)
     })
 }

#' Get hits by date
#'
#' Get a list of hits by date (hits to the datastream_date).
#'
#' @param base_url The base URL of the Junar service
#' @param api_key The user's API key for the Junar service
#' @export
get_statsDS_Date <- function(base_url, api_key, from, to){
     if (missing(base_url)) {
       warning("Please add a valid base URL")
     } else if (missing(api_key)) {
       warning(
       "Please add a valid API key for the base URL you are trying to access"
       )
     } else if (missing (from)) {
       warning("Please add a valid Date format dd/mm/yyyy")
     } else if (missing(to)) {
       warning("Please add a valid Date format dd/mm/yyyy")
     }
     try({
       r <- GET(paste(base_url, "?auth_key=", api_key,
           "&from=", from, "&to=", to, sep=""), accept_json())
       dataset <- fromJSON(content(r, "text"))
       dataset <- dataset$datastream$stats$resources

       df <- as.data.frame(dataset)
       colnames(df) <- dataset[1,]
       df <- df [-1,]

       return(dataset)
     })
   }


#' Get hits by groupMonth
#'
#' Get a list of hits by groupMonth
#'
#' @param base_url The base URL of the Junar service
#' @param api_key The user's API key for the Junar service
#' @export
get_statsDS_Month <- function(base_url, api_key, month){
  if (missing(base_url)) {
    warning("Please add a valid base URL")
  } else if (missing(api_key)) {
    warning(
      "Please add a valid API key for the base URL you are trying to access"
    )
  }
  try({
    r <- GET(paste(base_url, "?auth_key=",
        api_key, "&group_by=", month, sep=""), accept_json())
    dataset <- fromJSON(content(r, "text"))
    dataset <- dataset$datastreams$stats$articles_over_time

    df <- as.data.frame(dataset)
    colnames(df) <- dataset[1,]
    df <- df [-1,]

    return(dataset)
  })
}


