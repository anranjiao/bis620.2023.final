#' @title Linear model for prediction
#' @description Use a stepwise linear model to predict the death days.
#' @param dataset Contains x_train, y_train, x_test, y_test, min_label,
#' and max_label
#' @importFrom stats predict lm step
#' @importFrom tibble tibble
#' @export

linear_model <- function(dataset) {
  feature_dth_train_norm = dataset$x_train
  feature_dth_test_norm = dataset$x_test
  label_dth_train_norm = dataset$y_train
  label_dth_test_norm = dataset$y_test
  max_label = dataset$max_label
  min_label = dataset$min_label
  lrm = lm(label_dth_train_norm$DTHDY ~ .,data=feature_dth_train_norm)
  lrm1 = step(lrm)

  pa_train = tibble(
    pred=as.integer(predict(lrm1)*(max_label-min_label)+min_label),
    actual= as.integer(label_dth_train_norm$DTHDY*(max_label-min_label)+min_label))


  pa_test = tibble(
    pred=as.integer(predict(lrm1, feature_dth_test_norm)*(max_label-min_label)+min_label),
    actual=as.integer(label_dth_test_norm$DTHDY*(max_label-min_label)+min_label))

  mae_test = mean(abs(pa_test$pred - pa_test$actual))
  mae_train = mean(abs(pa_train$pred - pa_train$actual))
  return(list(pa_train=pa_train, pa_test=pa_test, mae_train=mae_train, mae_test=mae_test))
}
