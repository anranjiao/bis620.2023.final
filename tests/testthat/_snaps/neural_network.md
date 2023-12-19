# neural_network() works

    Code
      neural_network(dataset, 5)
    Output
      $pa_train
      # A tibble: 600 x 2
          pred actual
         <int>  <int>
       1   282    558
       2   265    301
       3   399    460
       4   258    965
       5   329    211
       6   342    339
       7   730    731
       8   553    696
       9   520    552
      10   557    197
      # i 590 more rows
      
      $pa_test
      # A tibble: 87 x 2
          pred actual
         <int>  <int>
       1   655    411
       2    95    170
       3   201    255
       4   627    490
       5   290    496
       6   379    230
       7   309    999
       8   577    644
       9   548    318
      10   162    660
      # i 77 more rows
      
      $mae_train
      [1] 203.7767
      
      $mae_test
      [1] 222.7126
      

