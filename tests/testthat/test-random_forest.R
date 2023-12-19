test_that("random_forest() works", {
  data("adsl")
  data("biomark")
  dataset = preprocessing(adsl, biomark, 600)
  expect_failure(expect_equal(random_forest(dataset), random_forest(dataset)))
})
