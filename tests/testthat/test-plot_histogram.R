test_that("plot_histogram() works", {
  data("adsl")
  data("biomark")
  dataset = preprocessing(adsl, biomark, 600)
  data = linear_model(dataset)
  vdiffr::expect_doppelganger(
    "plot-histogram",
    plot_histogram(data, 12)
  )
})
