
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bis620.2023

<!-- badges: start -->

[![R-CMD-check](https://github.com/anranjiao/bis620.2023.final/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/anranjiao/bis620.2023.final/actions/workflows/R-CMD-check.yaml)
[![test-coverage](https://github.com/anranjiao/bis620.2023.final/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/anranjiao/bis620.2023.final/actions/workflows/test-coverage.yaml)
<!-- badges: end -->

## Installation

You can install the development version of bis620.2023.final from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
# devtools::install_github("anranjiao/bis620.2023.final")
```

## Description

The dataset investigated in this project originates from the PRIME
(Panitumumab Randomized Trial in Combination with Chemotherapy for
Metastatic Colorectal Cancer to Determine Efficacy). This study was
conducted to assess the impacts of panitumumab treatment on top of the
standard FOLFOX treatment compared to FOLFOX alone for metastatic
colorectal cancer. We utilize three different models to predict the
death days of the patients and the side effect such as rash.

## Examples

These are some basic examples:

``` r
library(bis620.2023.final)

data("adsl")
data("biomark")
dataset = preprocessing(adsl, biomark, 600)
data = random_forest(dataset)
plot_histogram(data, 12)
```

<img src="man/figures/README-example-1.png" width="100%" />

    #> $breaks
    #>  [1]   0  50 100 150 200 250 300 350 400 450 500 550 600
    #> 
    #> $counts
    #>  [1] 18 17  9 11  4  7  6  7  4  2  1  1
    #> 
    #> $density
    #>  [1] 0.0041379310 0.0039080460 0.0020689655 0.0025287356 0.0009195402
    #>  [6] 0.0016091954 0.0013793103 0.0016091954 0.0009195402 0.0004597701
    #> [11] 0.0002298851 0.0002298851
    #> 
    #> $mids
    #>  [1]  25  75 125 175 225 275 325 375 425 475 525 575
    #> 
    #> $xname
    #> [1] "abs(pa_test$pred - pa_test$actual)"
    #> 
    #> $equidist
    #> [1] TRUE
    #> 
    #> attr(,"class")
    #> [1] "histogram"
    plot_scatter_residual(data)

<img src="man/figures/README-example-2.png" width="100%" />

``` r
data("adae")
dataset = preprocessing_rash(adsl, biomark, adae, 800)
random_forest_rash(dataset)
#> $pa_train
#> # A tibble: 800 × 2
#>         pred actual
#>    <dbl[1d]>  <int>
#>  1         0      0
#>  2         0      0
#>  3         0      0
#>  4         0      0
#>  5         0      0
#>  6         1      1
#>  7         0      0
#>  8         1      1
#>  9         0      0
#> 10         1      1
#> # ℹ 790 more rows
#> 
#> $pa_test
#> # A tibble: 131 × 2
#>         pred actual
#>    <dbl[1d]>  <int>
#>  1         0      0
#>  2         0      0
#>  3         0      0
#>  4         0      0
#>  5         1      1
#>  6         0      0
#>  7         1      1
#>  8         1      1
#>  9         0      0
#> 10         0      0
#> # ℹ 121 more rows
#> 
#> $accuracy_train
#> [1] 0.9525
#> 
#> $accuracy_test
#> [1] 0.7175573
```

## Test Coverage

[Link](https://github.com/anranjiao/bis620.2023.final/actions/runs/7280401561)
