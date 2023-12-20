#' @title Random Forest for prediction
#' @description Use a random forest model to predict the death days.
#' @param dataset feature_dth_train_norm, feature_dth_test_norm, label_dth_train_norm, label_dth_test_norm
#' @importFrom randomForestSRC rfsrc
#' @importFrom tibble tibble
#' @export

random_forest_rash <- function(dataset) {
  feature_dth_train_norm = dataset$x_train
  feature_dth_test_norm = dataset$x_test
  label_dth_train_norm = dataset$y_train
  label_dth_test_norm = dataset$y_test

  feature_and_label = cbind(feature_dth_train_norm, label_dth_train_norm)

  fit <- rfsrc(AEPT ~., data = feature_and_label)

  pa_train = tibble(
    pred = (fit$predicted),
    actual = (label_dth_train_norm$AEPT)
  )

  test_feature_and_label = cbind(feature_dth_test_norm, label_dth_test_norm)

  test_fit <- predict(fit, newdata = feature_dth_test_norm)

  pa_test = tibble(
    pred = (test_fit$predicted),
    actual = (label_dth_test_norm$AEPT)
  )

  accuracy_train = 1-mean(abs(pa_train$pred - pa_train$actual))
  accuracy_test = 1-mean(abs(pa_test$pred - pa_test$actual))

  return(list(pa_train=pa_train, pa_test=pa_test, accuracy_train=accuracy_train, accuracy_test=accuracy_test))
}
