test_that("plot_scatter_residual() works", {
  data("adsl")
  data("biomark")
  dataset = preprocessing(adsl, biomark, 600)
  data = linear_model(dataset)

  vdiffr::expect_doppelganger(
    "plot-scatter",
    plot_scatter_residual(data)
  )
})
