library(junr)
context("Get data")

# Look for a development connection to the Junar API so that we do not 
# have to test against an existing implementation
base_url <- ""
api_token <- ""

test_that("The data index is read correctly"){
  # TODO: set up tests that are independent of the API implementation 
  # expect_that(get_index(base_url, api_token), is.data.frame())
}

