library(torch)
#' @title Neural network to predict death days
#' @param dataset Contains x_train, y_train, x_test, y_test, min_label,
#' and max_label
#' @return Two tibbles with a `pred` column and a `actual` column of the
#' death days for training and testing, respectively;
#' mae (mean absolute value) for training and testing.
#' @importFrom torch nn_module nn_linear nnf_relu nnf_sigmoid
#' @importFrom torch torch_tensor optim_adam nnf_mse_loss
#' @importFrom tibble tibble

neural_network = function(dataset, n){
  my_module = nn_module(
    initialize = function(in_features, out_features) {
      self$l1 = nn_linear(in_features, n, bias = TRUE)
      self$l2 = nn_linear(n, n, bias = TRUE)
      self$l3 = nn_linear(n, out_features, bias = TRUE)
    },
    forward = function(input) {
      input |>
        self$l1() |> nnf_relu() |>
        self$l2() |> nnf_relu() |>
        self$l3() |> nnf_sigmoid()
    }
  )

  x_train = dataset$x_train
  y_train = dataset$y_train
  x_test = dataset$x_test
  y_test = dataset$y_test
  min_label = dataset$min_label
  max_label = dataset$max_label

  y = torch_tensor(as.matrix(y_train), device = "cpu")
  x = torch_tensor(as.matrix(x_train), device = "cpu")


  mm = my_module(ncol(x), 1)
  optimizer = optim_adam(mm$parameters)
  num_it = 2000

  losses = rep(NA, num_it)

  for (i in seq_len(num_it)) {
    optimizer$zero_grad()
    pred = mm(x)
    loss = nnf_mse_loss(y, pred)
    loss$backward()
    losses[i] = as.numeric(loss)
    optimizer$step()
  }
  mm$parameters

  y_test = torch_tensor(as.matrix(y_test), device = "cpu")
  x_test = torch_tensor(as.matrix(x_test), device = "cpu")
  pred_test = mm(x_test)
  pred_train = mm(x)

  pa_train = tibble(
    pred = as.integer(pred_train*(max_label-min_label)+min_label),
    actual = as.integer(y*(max_label-min_label)+min_label)
  )
  pa_test = tibble(
    pred = as.integer(pred_test*(max_label-min_label)+min_label),
    actual = as.integer(y_test*(max_label-min_label)+min_label)
  )
  mae_train=mean(abs(pa_train$pred-pa_train$actual))
  mae_test=mean(abs(pa_test$pred-pa_test$actual))
  output = list(pa_train=pa_train, pa_test=pa_test,
                mae_train=mae_train, mae_test=mae_test)
  return(output)
}
