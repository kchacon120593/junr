library(junr)
context("Get data")

base_url <- "http://api.datosabiertos.presidencia.go.cr/api/v2/datastreams/"
api_token <- "2ac5dbd5b269c1c4937e77a4bc14169c738be8ab"

test_that("The data index is read correctly"){
  expect_that(get_index(base_url, api_token), is.data.frame())
}

