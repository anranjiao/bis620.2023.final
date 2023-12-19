#' @title Random Forest for prediction
#' @description Use a random forest model to predict the death days.
#' @param dataset feature_dth_train_norm, feature_dth_test_norm, label_dth_train_norm, label_dth_test_norm
#' @importFrom randomForestSRC rfsrc
#' @importFrom tibble tibble
#' @export

random_forest <- function(dataset) {
  feature_dth_train_norm = dataset$x_train
  feature_dth_test_norm = dataset$x_test
  label_dth_train_norm = dataset$y_train
  label_dth_test_norm = dataset$y_test
  max_label = dataset$max_label
  min_label = dataset$min_label

  feature_and_label = cbind(feature_dth_train_norm, label_dth_train_norm)

  fit <- rfsrc(DTHDY ~., data = feature_and_label)

  pa_train = tibble(
    pred = (fit$predicted*(max_label-min_label)+min_label),
    actual = (label_dth_train_norm$DTHDY*(max_label-min_label)+min_label)
  )

  test_feature_and_label = cbind(feature_dth_test_norm, label_dth_test_norm)

  test_fit <- predict(fit, newdata = feature_dth_test_norm)

  pa_test = tibble(
    pred = (test_fit$predicted*(max_label-min_label)+min_label),
    actual = (label_dth_test_norm$DTHDY*(max_label-min_label)+min_label)
  )

  mae_test = mean(abs(pa_test$pred - pa_test$actual))
  mae_train = mean(abs(pa_train$pred - pa_train$actual))

  return(list(pa_train=pa_train, pa_test=pa_test, mae_train=mae_train, mae_test=mae_test))
}
