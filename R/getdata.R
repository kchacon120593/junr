#' @import httr
#' @import jsonlite
#'
NULL

#' Get a list of GUID's
#'
#' Get a list of all the available GUID's with datasets or views from the
#' base URL
#'
#' @param base_url The base url of the Junar service
#' @param api_token The user's API token for the Junar service
#' @keywords GUID
#' @export
get_index <- function(base_url, api_token){
  if (missing(base_url)) {
    warning("Please add a valid base URL")
  }
  if (missing(api_token)) {
    warning("Please add a valid api token for the base url you are trying to access")
  }
  try({
    r <- GET(paste(base_url, "?auth_key=", api_token, sep=""), accept_json())
    content_index <- fromJSON(content(r, "text"))
    return(content_index)
  })
}

#' Show GUID list
#'
#' Show a simple list of all available GUID. This is not adding the titles to
#' the list because it generaly will not fit in the console window.
#'
#' @param base_url The base url of the Junar service
#' @param api_token The user's API token for the Junar service
#' @keywords GUID
#' @export
guid_list <- function(base_url, api_token){
  if (missing(base_url)) {
    warning("Please add a valid base URL")
  }
  if (missing(api_token)) {
    warning("Please add a valid api token for the base url you are trying to access")
  }
  try({
    content_index <- get_index(base_url, api_token)
    return(content_index$guid)
  })
}
#' Show GUID titles
#'
#' Show a simple list of all available GUID titles. This is not adding the
#' titles to the list because it generaly will not fit in the console window.
#'
#' @param base_url The base url of the Junar service
#' @param api_token The user's API token for the Junar service
#' @keywords GUID
#' @export
guid_titles <- function(base_url, api_token){
  if (missing(base_url)) {
    warning("Please add a valid base URL")
  }
  if (missing(api_token)) {
    warning("Please add a valid api token for the base url you are trying to access")
  }
  try({
    content_index <- get_index(base_url, api_token)
    return(content_index$title)
  })
}

#' Get data for a given GUID
#'
#' Get the data for any given GUID and return it as a data frame. Note that we
#' use the "ajson" json format from the api. The "json" format has a more
#' difficult structure.
#'
#' We do use the json response to get the fLength value, which indicates the
#' length of the dataset. This way we can include a fixed way to get arround the
#' default limit of 1000 rows of the junar api.
#'
#' Note that this removes all metadata from the json response given by the api.
#'
#' @param base_url The base url of the Junar service
#' @param api_token The user's API token for the Junar service
#' @param guid The user's API token for the Junar service
#' @keywords GUID
#' @export

get_data <- function(base_url, api_token, guid) {
  if (missing(base_url)) {
    warning("Please add a valid base URL")
  }
  if (missing(api_token)) {
    warning("Please add a valid api token for the base url you are trying to access")
  }
  if (missing(guid)) {
    warning("Please add a valid guid for the dataset you are trying to access")
  }
  try({
    r_json <- GET(paste(base_url, guid, "/data.json/","?auth_key=", api_token, sep=""), accept_json())
    jsondata <- fromJSON(content(r_json, "text"))
    data_length <- jsondata$result$fLength

    r_ajson <- GET(paste(base_url, guid, "/data.ajson/","?auth_key=", api_token, "&limit=", data_length, sep=""), accept_json())
    dataset <- fromJSON(content(r_ajson, "text"))
    dataset <- dataset$result
    df <- as.data.frame(dataset)
    colnames(df) <- dataset[1,]
    df <- df [-1,]
    return(df)
  })
}
