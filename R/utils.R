#' Clean Currency Values
#'
#' Often Junar data involving currency data is not clean because for some reason
#' content and presentation of currency values is not separated). To clean up
#' this data quickly the following helper function accepts the character value
#' for the currency and the thousands and decimal delimiters.
#'
#' It defaults to Costa Rican Colon for no other reason than that this is
#' written in Costa Rica, and the Colon has symbol that is uncommon and leads to
#' errors easily in R.
#'
#' @param currency_column The column in the data frame that contains the currency values.
#' @param currency_symbol_pos The position from the left of the currency symbol
#'   used. If any spaces are included, please include them here as well.
#' @param thousand_separator The character value that separates thousands (defaults to ",")
#' @param decimal_separator The character value that separates decimals (defaults to ".")
#' @keywords Currency, Data Cleaning, Scrubbing
#' @export
clean_currency <- function(currency_column, currency_symbol_pos=1, thousand_separator=",", decimal_separator=".") {
  clean_currency <- gsub(get_currency_character(currency_column[1],
                                                currency_symbol_pos), "",
                                                currency_column)
  clean_currency <- gsub(thousand_separator, "", clean_currency)
  if (decimal_separator != ".") {
  clean_currency <- gsub(decimal_separator, ".", clean_currency)
  }
  clean_currency <- as.numeric(clean_currency)
}


#' Get the currency symbol
#'
#' The currency symbol is not always obvious, depending on the currency you are
#' working with. The symbol for Costa Rican Colon, for instance may not dispaly
#' correctly or the same. It may appear as "¢" or as "₡" in the same R session.
#'
#' To have a check in place you can request the first character of the currency
#' strings with this function, and use it either to assign the currency value,
#' or to do a sanity check.
#'
#' @param currency_value A single value from the currency column
#' @param currency_symbol_pos The number of positions from the left for the
#'   currency symbol (include any spaces)
#' @export
get_currency_character <- function(currency_value, currency_symbol_pos){
  currency_character <- substring(currency_value, 1, 1)
  return(currency_character)
}
