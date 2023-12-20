#' @title Neural network to predict death days
#' @param x_train features for training
#' @param y_train label for training#'
#' @param x_test features for testing
#' @param y_test label for testing
#' @param min_label minimun value of label
#' @param max_label maximun value of label
#' @param n number of nodes per hidden layer
#' @return Two tibbles with a `pred` column and a `actual` column of the
#' death days for training and testing, respectively;
#' mae (mean absolute value) for training and testing.
#' @importFrom torch nn_module nn_linear nnf_relu nnf_sigmoid
#' @importFrom torch torch_tensor optim_adam nnf_mse_loss torch_manual_seed
#' @importFrom tibble tibble

neural_network = function(x_train, y_train, x_test, y_test, min_label, max_label, n){
  torch::install_torch()
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

  mm = my_module(ncol(x_train), 1)
  optimizer = optim_adam(mm$parameters)
  num_it = 2000

  losses = rep(NA, num_it)

  for (i in seq_len(num_it)) {
    optimizer$zero_grad()
    pred = mm(x_train)
    loss = nnf_mse_loss(y_train, pred)
    loss$backward()
    losses[i] = as.numeric(loss)
    optimizer$step()
  }
  mm$parameters

  pred_test = mm(x_test)
  pred_train = mm(x_train)

  pa_train = tibble(
    pred = as.integer(pred_train*(max_label-min_label)+min_label),
    actual = as.integer(y_train*(max_label-min_label)+min_label)
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
