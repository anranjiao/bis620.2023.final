#' @title Preprocess data
#' @description Data preprocess the datasets, convert the category features to
#' one-hot vectors, and prepare dataset for machine learning models.
#' @param info dataset 1
#' @param biomark dataset 2
#' @param num_train number of training data
#' @importFrom dplyr select filter mutate mutate_if left_join
#' @importFrom mltools one_hot
#' @importFrom data.table as.data.table
#' @importFrom stats na.omit
#' @export

preprocessing <- function(info, biomark, num_train) {
  info = info |>
    select(SUBJID,ATRT, PRSURG, DTHDY, DTH, LIVERMET, AGE, SEX, B_WEIGHT, B_HEIGHT, RACE, B_ECOG, HISSUBTY, B_METANM, DIAGTYPE) |>
    na.omit() |>
    filter(DTH == 1)
  death_info  = info |> select(SUBJID, DTHDY, DTH)
  basic_info = info |> select(SUBJID, ATRT, PRSURG, LIVERMET, AGE, SEX, B_WEIGHT, B_HEIGHT, RACE, B_ECOG, HISSUBTY, B_METANM, DIAGTYPE)
  basic_info_onehot = basic_info |>
    mutate(ATRT=factor(ATRT), PRSURG=factor(PRSURG), LIVERMET=factor(LIVERMET), SEX=factor(SEX),
           RACE=factor(RACE), B_ECOG=factor(B_ECOG), HISSUBTY=factor(HISSUBTY), DIAGTYPE=factor(DIAGTYPE))

  feature_info = one_hot(as.data.table(basic_info_onehot))
  feature_info$`ATRT_FOLFOX alone` = NULL
  feature_info$PRSURG_N = NULL
  feature_info$LIVERMET_N = NULL
  feature_info$SEX_Female = NULL
  feature_info$RACE_Asian = NULL
  feature_info$B_ECOG_ = NULL
  feature_info$HISSUBTY_ = NULL
  feature_info$DIAGTYPE_Rectal = NULL

  biomark = biomark |>
    select(SUBJID, BMMTR1, BMMTR2, BMMTR3, BMMTR4, BMMTR5, BMMTR6, BMMTR7, BMMTR15, BMMTR16) |>
    mutate_if(is.character, ~ ifelse(.x == "", "Unknown", .x)) |>
    mutate(BMMTR1=factor(BMMTR1), BMMTR2=factor(BMMTR2), BMMTR3=factor(BMMTR3), BMMTR4=factor(BMMTR4), BMMTR5=factor(BMMTR5), BMMTR6=factor(BMMTR6), BMMTR7=factor(BMMTR7), BMMTR15=factor(BMMTR15), BMMTR16=factor(BMMTR16))
  feature_biomark = one_hot(as.data.table(biomark))
  feature_biomark$BMMTR1_Failure = NULL
  feature_biomark$BMMTR2_Failure = NULL
  feature_biomark$BMMTR3_Failure = NULL
  feature_biomark$BMMTR4_Failure = NULL
  feature_biomark$BMMTR5_Failure = NULL
  feature_biomark$BMMTR6_Failure = NULL
  feature_biomark$BMMTR7_Failure = NULL
  feature_biomark$BMMTR15_Failure = NULL
  feature_biomark$BMMTR16_Failure = NULL

  feature_dth = feature_info |>
    left_join(feature_biomark, by = "SUBJID")

  feature_dth_train_norm = feature_dth[, -1][1:(num_train)]

  min_age=min(feature_dth_train_norm$AGE)
  min_weight=min(feature_dth_train_norm$B_WEIGHT)
  min_hight=min(feature_dth_train_norm$B_HEIGHT)
  max_age=max(feature_dth_train_norm$AGE)
  max_weight=max(feature_dth_train_norm$B_WEIGHT)
  max_hight=max(feature_dth_train_norm$B_HEIGHT)

  feature_dth_train_norm$AGE = (feature_dth_train_norm$AGE-min_age)/(max_age-min_age)
  feature_dth_train_norm$B_WEIGHT = (feature_dth_train_norm$B_WEIGHT-min_weight)/(max_weight-min_weight)
  feature_dth_train_norm$B_HEIGHT = (feature_dth_train_norm$B_HEIGHT-min_hight)/(max_hight-min_hight)

  feature_dth_test_norm = feature_dth[, -1][(num_train+1):687]
  feature_dth_test_norm$AGE = (feature_dth_test_norm$AGE-min_age)/(max_age-min_age)
  feature_dth_test_norm$B_WEIGHT = (feature_dth_test_norm$B_WEIGHT-min_weight)/(max_weight-min_weight)
  feature_dth_test_norm$B_HEIGHT = (feature_dth_test_norm$B_HEIGHT-min_hight)/(max_hight-min_hight)

  label_dth_train_norm = death_info[1:(num_train), 2]
  min_label = min(label_dth_train_norm)
  max_label = max(label_dth_train_norm)
  label_dth_train_norm = (label_dth_train_norm-min_label)/(max_label-min_label)

  label_dth_test_norm = death_info[(num_train+1):687, 2]
  label_dth_test_norm = (label_dth_test_norm-min_label)/(max_label-min_label)
  outputs = list(x_train = feature_dth_train_norm, x_test = feature_dth_test_norm,
       y_train = label_dth_train_norm, y_test = label_dth_test_norm, min_label = min_label, max_label = max_label)
  return(outputs)
}
