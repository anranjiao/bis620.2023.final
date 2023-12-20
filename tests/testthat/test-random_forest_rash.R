test_that("random_forest_rash() works", {
  data("adsl")
  data("biomark")
  data("adae")
  dataset = preprocessing_rash(adsl, biomark, adae, 800)
  expect_failure(expect_equal(random_forest_rash(dataset), random_forest_rash(dataset)))
})
