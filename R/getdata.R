#' Get a list of GUID's
#'
#' Get a list of all the available GUID's with datasets or views from the
#' base URL
#' @param base_url The base url of the Junar service
#' @param api_token The user's API token for the Junar service
#' @keywords GUID
#' @export
get_guid <- function(base_url, api_token){
  if (missing(base_url)) {
    warning("Please add a valid base URL")
  }
  if (missing(api_token)) {
    warning("Please add a valid api token for the base url you are trying to access")
  }
  try({
    r <- GET(paste(base_url, "?auth_key=", api_token, sep=""), accept_json())
     content_index <- fromJSON(content(r, "text"))
     return(content_index$guid)
  })
}


