% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{get_currency_character}
\alias{get_currency_character}
\title{Get the currency symbol}
\usage{
get_currency_character(currency_value, currency_symbol_pos)
}
\arguments{
\item{currency_value}{A single value from the currency column}

\item{currency_symbol_pos}{The number of positions from the left for the
currency symbol (include any spaces)}
}
\description{
The currency symbol is not always obvious, depending on the currency you are
working with. The symbol for Costa Rican Colon, for instance may not display
correctly or the same. It may have different appearances in the same R
session, and cannot be included here because they lead to built errors.
}
\details{
To have a check in place you can request the first character of the currency
strings with this function, and use it either to assign the currency value,
or to do a sanity check.
}
