test_that("neural_network() works", {
  data("adsl")
  data("biomark")
  dataset = preprocessing(adsl, biomark, 600)
  # expect_failure(expect_equal(neural_network(dataset, 5), neural_network(dataset, 5)))
})
