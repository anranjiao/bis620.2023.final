test_that("preprocessing_rash() works", {
  data("adsl")
  data("biomark")
  data("adae")
  expect_snapshot(preprocessing_rash(adsl, biomark, adae, 800))
})
