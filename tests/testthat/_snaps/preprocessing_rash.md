# preprocessing_rash() works

    Code
      preprocessing_rash(adsl, biomark, adae, 800)
    Output
      $x_train
           ATRT_Panitumumab + FOLFOX PRSURG_Y LIVERMET_Y       AGE SEX_Male  B_WEIGHT
        1:                         0        1          1 0.6379310        1 0.2220472
        2:                         1        1          1 0.6551724        1 0.2440945
        3:                         0        1          1 0.5689655        1 0.3070866
        4:                         0        1          1 0.6379310        0 0.1259843
        5:                         0        0          1 0.8103448        1 0.2362205
       ---                                                                           
      796:                         0        1          1 0.7586207        1 0.2283465
      797:                         1        1          1 0.6379310        0 0.2283465
      798:                         0        1          0 0.7758621        1 0.3307087
      799:                         1        1          1 0.7758621        1 0.2007874
      800:                         0        1          1 0.1896552        0 0.1653543
            B_HEIGHT RACE_Black or African American RACE_Hispanic or Latino
        1: 0.5238095                              0                       0
        2: 0.4920635                              0                       0
        3: 0.6507937                              0                       0
        4: 0.4126984                              0                       0
        5: 0.5873016                              0                       0
       ---                                                                 
      796: 0.6984127                              0                       0
      797: 0.4761905                              0                       0
      798: 0.3174603                              0                       0
      799: 0.4603175                              0                       0
      800: 0.4603175                              0                       0
           RACE_Other RACE_White or Caucasian B_ECOG_Fully active
        1:          0                       1                   0
        2:          0                       1                   0
        3:          0                       1                   0
        4:          0                       1                   0
        5:          0                       1                   1
       ---                                                       
      796:          0                       1                   0
      797:          0                       1                   1
      798:          0                       1                   1
      799:          0                       1                   0
      800:          0                       1                   0
           B_ECOG_In bed less than 50% of the time B_ECOG_Symptoms but ambulatory
        1:                                       0                              1
        2:                                       0                              1
        3:                                       0                              1
        4:                                       0                              1
        5:                                       0                              0
       ---                                                                       
      796:                                       0                              1
      797:                                       0                              0
      798:                                       0                              0
      799:                                       0                              1
      800:                                       0                              1
           HISSUBTY_Appendiceal HISSUBTY_Mucinous HISSUBTY_No sub-type HISSUBTY_Other
        1:                    0                 0                    1              0
        2:                    0                 0                    1              0
        3:                    0                 0                    1              0
        4:                    0                 1                    0              0
        5:                    0                 1                    0              0
       ---                                                                           
      796:                    0                 0                    1              0
      797:                    0                 0                    0              0
      798:                    0                 0                    0              1
      799:                    0                 1                    0              0
      800:                    0                 0                    1              0
           HISSUBTY_Unknown B_METANM DIAGTYPE_Colon BMMTR1_Mutant BMMTR1_Unknown
        1:                0        3              1             0              1
        2:                0        5              1             1              0
        3:                0        1              1             1              0
        4:                0        2              1             1              0
        5:                0        1              0             0              1
       ---                                                                      
      796:                0        3              0             0              0
      797:                1        1              1             1              0
      798:                0        1              1             1              0
      799:                0        2              1             0              0
      800:                0        2              0             1              0
           BMMTR1_Wild-type BMMTR2_Mutant BMMTR2_Unknown BMMTR2_Wild-type
        1:                0             0              1                0
        2:                0             0              1                0
        3:                0             0              1                0
        4:                0             0              1                0
        5:                0             0              1                0
       ---                                                               
      796:                1             0              0                1
      797:                0             0              1                0
      798:                0             0              1                0
      799:                1             0              0                1
      800:                0             0              1                0
           BMMTR3_Mutant BMMTR3_Unknown BMMTR3_Wild-type BMMTR4_Mutant BMMTR4_Unknown
        1:             0              1                0             0              1
        2:             0              1                0             0              1
        3:             0              1                0             0              1
        4:             0              1                0             0              1
        5:             0              1                0             0              1
       ---                                                                           
      796:             0              0                1             0              0
      797:             0              1                0             0              1
      798:             0              1                0             0              1
      799:             0              0                1             0              0
      800:             0              1                0             0              1
           BMMTR4_Wild-type BMMTR5_Mutant BMMTR5_Unknown BMMTR5_Wild-type
        1:                0             0              1                0
        2:                0             0              1                0
        3:                0             0              1                0
        4:                0             0              1                0
        5:                0             0              1                0
       ---                                                               
      796:                1             0              0                1
      797:                0             0              1                0
      798:                0             0              1                0
      799:                1             0              0                1
      800:                0             0              1                0
           BMMTR6_Unknown BMMTR6_Wild-type BMMTR7_Mutant BMMTR7_Unknown
        1:              1                0             0              1
        2:              1                0             0              1
        3:              1                0             0              1
        4:              1                0             0              1
        5:              1                0             0              1
       ---                                                             
      796:              0                1             0              0
      797:              1                0             0              1
      798:              1                0             0              1
      799:              0                1             1              0
      800:              1                0             0              1
           BMMTR7_Wild-type BMMTR15_Mutant BMMTR15_Unknown BMMTR15_Wild-type
        1:                0              0               1                 0
        2:                0              0               1                 0
        3:                0              0               1                 0
        4:                0              0               1                 0
        5:                0              0               1                 0
       ---                                                                  
      796:                1              0               0                 1
      797:                0              0               1                 0
      798:                0              0               1                 0
      799:                0              0               0                 1
      800:                0              0               1                 0
           BMMTR16_Mutant BMMTR16_Unknown BMMTR16_Wild-type
        1:              0               1                 0
        2:              0               1                 0
        3:              0               1                 0
        4:              0               1                 0
        5:              0               1                 0
       ---                                                 
      796:              0               0                 1
      797:              0               1                 0
      798:              0               1                 0
      799:              0               0                 1
      800:              0               1                 0
      
      $x_test
           ATRT_Panitumumab + FOLFOX PRSURG_Y LIVERMET_Y        AGE SEX_Male
        1:                         0        1          1 0.50000000        1
        2:                         1        1          1 0.70689655        0
        3:                         0        1          1 0.68965517        1
        4:                         0        1          1 0.01724138        0
        5:                         1        1          1 0.32758621        0
       ---                                                                  
      127:                         0        1          1 0.67241379        0
      128:                         0        1          1 0.68965517        1
      129:                         1        1          1 0.15517241        1
      130:                         1        1          1 0.82758621        0
      131:                         0        1          1 0.67241379        1
             B_WEIGHT  B_HEIGHT RACE_Black or African American
        1: 0.44094488 0.7777778                              0
        2: 0.12204724 0.3174603                              0
        3: 0.11023622 0.5714286                              0
        4: 0.10787402 0.4047619                              0
        5: 0.07874016 0.3809524                              0
       ---                                                    
      127: 0.09448819 0.3809524                              0
      128: 0.30708661 0.6984127                              0
      129: 0.59055118 0.8730159                              0
      130: 0.26377953 0.3968254                              0
      131: 0.32283465 0.5555556                              0
           RACE_Hispanic or Latino RACE_Other RACE_White or Caucasian
        1:                       0          0                       1
        2:                       0          0                       1
        3:                       0          0                       1
        4:                       0          0                       1
        5:                       0          0                       1
       ---                                                           
      127:                       0          0                       1
      128:                       0          0                       1
      129:                       0          0                       1
      130:                       0          0                       1
      131:                       0          0                       1
           B_ECOG_Fully active B_ECOG_In bed less than 50% of the time
        1:                   1                                       0
        2:                   0                                       1
        3:                   0                                       1
        4:                   1                                       0
        5:                   1                                       0
       ---                                                            
      127:                   1                                       0
      128:                   1                                       0
      129:                   1                                       0
      130:                   1                                       0
      131:                   1                                       0
           B_ECOG_Symptoms but ambulatory HISSUBTY_Appendiceal HISSUBTY_Mucinous
        1:                              0                    0                 0
        2:                              0                    0                 1
        3:                              0                    0                 0
        4:                              0                    0                 1
        5:                              0                    0                 0
       ---                                                                      
      127:                              0                    0                 0
      128:                              0                    0                 0
      129:                              0                    0                 0
      130:                              0                    0                 0
      131:                              0                    0                 0
           HISSUBTY_No sub-type HISSUBTY_Other HISSUBTY_Unknown B_METANM
        1:                    1              0                0        4
        2:                    0              0                0        2
        3:                    1              0                0        3
        4:                    0              0                0        2
        5:                    0              0                1        2
       ---                                                              
      127:                    0              0                1        2
      128:                    1              0                0        2
      129:                    1              0                0        4
      130:                    1              0                0        1
      131:                    0              1                0        3
           DIAGTYPE_Colon BMMTR1_Mutant BMMTR1_Unknown BMMTR1_Wild-type BMMTR2_Mutant
        1:              0             0              0                1             0
        2:              1             1              0                0             0
        3:              1             0              0                1             0
        4:              1             0              0                1             0
        5:              1             0              0                1             0
       ---                                                                           
      127:              1             1              0                0             0
      128:              1             0              0                1             0
      129:              1             1              0                0             0
      130:              1             0              0                1             0
      131:              1             1              0                0             0
           BMMTR2_Unknown BMMTR2_Wild-type BMMTR3_Mutant BMMTR3_Unknown
        1:              0                1             0              0
        2:              1                0             0              1
        3:              0                1             0              0
        4:              0                1             0              0
        5:              0                1             0              0
       ---                                                             
      127:              1                0             0              1
      128:              0                1             0              0
      129:              1                0             0              1
      130:              0                1             0              0
      131:              1                0             0              1
           BMMTR3_Wild-type BMMTR4_Mutant BMMTR4_Unknown BMMTR4_Wild-type
        1:                1             0              0                1
        2:                0             0              1                0
        3:                0             0              0                1
        4:                1             0              0                1
        5:                1             0              0                1
       ---                                                               
      127:                0             0              1                0
      128:                1             1              0                0
      129:                0             0              1                0
      130:                1             0              0                1
      131:                0             0              1                0
           BMMTR5_Mutant BMMTR5_Unknown BMMTR5_Wild-type BMMTR6_Unknown
        1:             0              0                1              0
        2:             0              1                0              1
        3:             1              0                0              0
        4:             0              0                1              0
        5:             0              0                1              0
       ---                                                             
      127:             0              1                0              1
      128:             0              0                1              0
      129:             0              1                0              1
      130:             0              0                1              0
      131:             0              1                0              1
           BMMTR6_Wild-type BMMTR7_Mutant BMMTR7_Unknown BMMTR7_Wild-type
        1:                1             0              0                1
        2:                0             0              1                0
        3:                1             0              0                1
        4:                1             0              0                1
        5:                1             0              0                1
       ---                                                               
      127:                0             0              1                0
      128:                1             0              0                1
      129:                0             0              1                0
      130:                1             0              0                1
      131:                0             0              1                0
           BMMTR15_Mutant BMMTR15_Unknown BMMTR15_Wild-type BMMTR16_Mutant
        1:              0               0                 1              0
        2:              0               1                 0              0
        3:              0               0                 1              1
        4:              0               0                 1              0
        5:              0               0                 1              0
       ---                                                                
      127:              0               1                 0              0
      128:              0               0                 1              0
      129:              0               1                 0              0
      130:              0               0                 1              0
      131:              0               1                 0              0
           BMMTR16_Unknown BMMTR16_Wild-type
        1:               0                 1
        2:               1                 0
        3:               0                 0
        4:               0                 1
        5:               0                 1
       ---                                  
      127:               1                 0
      128:               0                 1
      129:               1                 0
      130:               0                 1
      131:               1                 0
      
      $y_train
      # A tibble: 800 x 1
          AEPT
         <int>
       1     0
       2     0
       3     0
       4     0
       5     0
       6     1
       7     0
       8     1
       9     0
      10     1
      # i 790 more rows
      
      $y_test
      # A tibble: 131 x 1
          AEPT
         <int>
       1     0
       2     0
       3     0
       4     0
       5     1
       6     0
       7     1
       8     1
       9     0
      10     0
      # i 121 more rows
      

