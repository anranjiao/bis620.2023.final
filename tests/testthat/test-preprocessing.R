test_that("preprocessing() works", {
  data("adsl")
  data("biomark")
  expect_snapshot(preprocessing(adsl, biomark, 600))
})
