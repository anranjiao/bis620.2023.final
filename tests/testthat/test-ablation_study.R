test_that("ablation_study() works", {
  data("adsl")
  data("biomark")
  dataset = preprocessing(adsl, biomark, 600)
  expect_not_equal(ablation_study(dataset, 'AGE'), 0)
})
