test_that("linear_model() works", {
    data("adsl")
    data("biomark")
    dataset = preprocessing(adsl, biomark, 600)
    expect_snapshot(linear_model(dataset))
  })
