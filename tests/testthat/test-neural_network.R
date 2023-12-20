test_that("neural_network() works", {
  data("adsl")
  data("biomark")
  dataset = preprocessing(adsl, biomark, 600)
  x_train=torch_tensor(as.matrix(dataset$x_train))
  y_train=torch_tensor(as.matrix(dataset$y_train))
  x_test=torch_tensor(as.matrix(dataset$x_test))
  y_test=torch_tensor(as.matrix(dataset$y_test))

  expect_failure(expect_equal(neural_network(x_train,y_train,x_test,y_test,dataset$min_label,dataset$max_label, 5),
                              neural_network(x_train,y_train,x_test,y_test,dataset$min_label,dataset$max_label, 5)))
})
