spork-minitest
==

Key differences from [spork-testunit](https://github.com/sporkrb/spork-testunit):

* Supports only Ruby 1.9.

* Allows passing any options to MiniTest.

  Normally you pass them right at the end:
  
  `ruby test/test_first.rb --seed 12345 -n test_truth`
  
  When using testdrb you pass them after double dash:
  
  `testdrb test/first_test.rb -- --seed 12345 -n test_truth`

* Exits with proper code (0 for success, 1 for failure).

  Some automated test running tools like Autotest and Guard rely on this to detect test failure.

* Does not support -I option, hardcoded to add `.` and `test` to the load path.
