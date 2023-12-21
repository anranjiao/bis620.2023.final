#' @title Residual Scatter Plot
#' @description Plots a scatter plot of residuals per patient
#' @param dataset feature_dth_train_norm, feature_dth_test_norm, label_dth_train_norm, label_dth_test_norm
#' @param test boolean whether to plot test or train
#' @importFrom randomForestSRC rfsrc
#' @importFrom ggplot2 ggplot aes geom_point theme_bw
#' @export

plot_scatter_residual <- function(dataset, test = TRUE) {

pa_train = dataset$pa_train
pa_test = dataset$pa_test

pa_test$row_num = seq_along(dataset$mae_test)
pa_train$row_num = seq_along(dataset$mae_train)
pa_test$residual = abs(pa_test$pred - pa_test$actual)
pa_train$residual = abs(pa_train$pred - pa_train$actual)
pa_test$row_num = seq_along(pa_test$residual)
pa_train$row_num = seq_along(pa_train$residual)

train_plot = ggplot(pa_train, aes(x = row_num, y = residual)) +
  geom_point() +
  theme_bw() +
  xlab("No. of data") +
  ylab("Residual")

test_plot = ggplot(pa_test, aes(x = row_num, y = residual)) +
  geom_point() +
  theme_bw() +
  xlab("No. of data") +
  ylab("Residual")

if (test) {
  test_plot
} else {
  train_plot
}
}
