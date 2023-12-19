## code to prepare `DATASET` dataset goes here

# library(haven)
# library(purrr)
# library(ggplot2)
# library(dplyr)
# # Load datasets
# trial_path = file.path("NCT00364013")
# trial_files = list.files(trial_path, pattern = "*_pds2019.sas7bdat") # a list if files
# dl = map(file.path(trial_path, trial_files), ~ read_sas(.x)) # dl[[1]] the 1st file
# names(dl) = gsub("*_pds2019.sas7bdat", "", trial_files)
# adsl = dl$adsl
# biomark = dl$biomark


adsl = readRDS("adsl.rds")
biomark = readRDS("biomark.rds")
usethis::use_data(adsl, overwrite = TRUE)
usethis::use_data(biomark, overwrite = TRUE)
