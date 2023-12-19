test_that("random_forest() works", {
  data("adsl")
  data("biomark")
  dataset = preprocessing(adsl, biomark, 600)
  expect_snapshot(random_forest(dataset))
})
