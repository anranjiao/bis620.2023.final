#' Conducts ablation study on a given dataset by removing one column
#'
#' one feature will be removed from the dataset to determine the performance degradation
#' @param train_set training set (includes features and label)
#' @param test_set test set (includes features and label)
#' @param del_feature string of feature name to exclude
#' @param max_label maximum value of the label
#' @param min_label minimum value of the label
#' @return a test error
#' @importFrom randomForestSRC rfsrc
#' @export
ablation_study = function(dataset, del_feature) {

  feature_dth_train_norm = dataset$x_train
  feature_dth_test_norm = dataset$x_test
  label_dth_train_norm = dataset$y_train
  label_dth_test_norm = dataset$y_test
  max_label = dataset$max_label
  min_label = dataset$min_label

  train_set = cbind(feature_dth_train_norm, label_dth_train_norm)
  test_set = cbind(feature_dth_test_norm, label_dth_test_norm)

  train_set[[del_feature]] = NULL
  test_set[[del_feature]] = NULL

  fit <- rfsrc(DTHDY ~., data = train_set)

  test_fitted <- predict(fit, newdata = test_set)

  pred = test_fitted$predicted * (max_label-min_label) + min_label
  actual = test_set$DTHDY * (max_label-min_label) + min_label

  ret = mean(abs(pred - actual))
  return(ret)
}
