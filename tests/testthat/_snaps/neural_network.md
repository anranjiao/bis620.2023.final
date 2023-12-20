# neural_network() works

    Code
      neural_network(dataset, 5)
    Output
      $pa_train
      # A tibble: 600 x 2
          pred actual
         <int>  <int>
       1   421    558
       2   218    301
       3   523    460
       4   474    965
       5   393    211
       6   256    339
       7   760    731
       8   488    696
       9   407    552
      10   507    197
      # i 590 more rows
      
      $pa_test
      # A tibble: 87 x 2
          pred actual
         <int>  <int>
       1   624    411
       2   214    170
       3   321    255
       4   687    490
       5   386    496
       6   404    230
       7   530    999
       8   566    644
       9   427    318
      10   257    660
      # i 77 more rows
      
      $mae_train
      [1] 195.3883
      
      $mae_test
      [1] 220.2299
      

