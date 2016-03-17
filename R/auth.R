# Authenticate
#
# Get the token to be used. The token is available through the website that
# offers the Junar API data

get_token <- function(token) {
  authenticate(token, "")
}
