test_that("mortality_fun works", {
  expect_equal(
    names(mortality_fun(maternal_mortality, "maternal_mortality")),
    c("iso", "year", "maternal_mortality")
  )
})
