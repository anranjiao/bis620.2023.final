# linear_model() works

    Code
      linear_model(dataset)
    Output
      $pa_train
      # A tibble: 600 x 2
          pred actual
         <int>  <int>
       1   457    558
       2   467    301
       3   455    460
       4   407    964
       5   559    211
       6   325    339
       7   566    731
       8   490    696
       9   537    552
      10   614    197
      # i 590 more rows
      
      $pa_test
      # A tibble: 87 x 2
          pred actual
         <int>  <int>
       1   580    410
       2   299    170
       3   319    255
       4   612    490
       5   643    496
       6   395    230
       7   422    999
       8   549    644
       9   641    318
      10   493    660
      # i 77 more rows
      
      $mae_train
      [1] 226.9483
      
      $mae_test
      [1] 190.5977
      

