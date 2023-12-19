# neural_network() works

    Code
      neural_network(dataset, 5)
    Output
      $pa_train
      # A tibble: 600 x 2
          pred actual
         <int>  <int>
       1   528    558
       2   284    301
       3   489    460
       4   513    965
       5   199    211
       6   241    339
       7   828    731
       8   639    696
       9   495    552
      10   401    197
      # i 590 more rows
      
      $pa_test
      # A tibble: 87 x 2
          pred actual
         <int>  <int>
       1   864    411
       2   258    170
       3   361    255
       4   444    490
       5   413    496
       6   351    230
       7   607    999
       8   606    644
       9   345    318
      10   312    660
      # i 77 more rows
      
      $mae_train
      [1] 192.6933
      
      $mae_test
      [1] 225.4483
      

