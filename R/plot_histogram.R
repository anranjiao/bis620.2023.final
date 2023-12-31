#' @title The histogram plot
#' @description Create a histogram of obsolute error between prediction and actual values
#' @param data the prediction and actual values
#' @param nbreak number of breaks in histogram
#' @return  histogram of the conditions
#' @importFrom graphics par hist
#' @export
plot_histogram = function(data, nbreak) {
  pa_train = data$pa_train
  pa_test = data$pa_test
  par(mfrow = c(1, 2))
  fig1 = hist(x=abs(pa_train$pred - pa_train$actual),breaks = nbreak, main="Absolute error of training", xlab="Absolute error", ylab="Frequency")
  fig2 = hist(x=abs(pa_test$pred - pa_test$actual),breaks = nbreak, main="Absolute error of testing", xlab="Absolute error", ylab="Frequency")
  fig1
  fig2
}
