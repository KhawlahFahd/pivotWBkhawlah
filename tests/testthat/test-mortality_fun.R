test_that("mortality_fun converts mortality data to long format", {

  result <- mortality_fun(
    maternal_mortality,
    "maternal_mortality"
  )

  expect_true(all(c("iso", "year", "maternal_mortality") %in% names(result)))
  expect_true(is.numeric(result$year))
})
