test_that("neural_network() works", {
  data("adsl")
  data("biomark")
  dataset = preprocessing(adsl, biomark, 600)
  torch::torch_manual_seed(1)
  expect_snapshot(neural_network(dataset, 5))
})
