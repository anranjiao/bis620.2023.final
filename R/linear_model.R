#' @title Linear model for prediction
#' @description Use a stepwise linear model to predict the death days.
#' @param dataset feature_dth_train_norm, feature_dth_test_norm, label_dth_train_norm, label_dth_test_norm
#' @importFrom stats predict lm step
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

  predicted_train = data.frame(
    pred=as.integer(predict(lrm1)*(max_label-min_label)+min_label),
    actual= as.integer(label_dth_train_norm$DTHDY*(max_label-min_label)+min_label))


  predicted_test = data.frame(
    pred=as.integer(predict(lrm1, feature_dth_test_norm)*(max_label-min_label)+min_label),
    actual=as.integer(label_dth_test_norm$DTHDY*(max_label-min_label)+min_label))

  return(list(predicted_train, predicted_test))
}
