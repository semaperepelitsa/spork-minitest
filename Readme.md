spork-minitest
==

Key differences from [spork-testunit](https://github.com/sporkrb/spork-testunit):

* Supports only Ruby 1.9.
* Allows passing options to MiniTest::Unit e.g. `testdrb test/first_test.rb -- --seed 12345`.
* Exits with proper code (0 for success, 1 for failure).
* Does not support -I option, hardcoded to add `.` and `test` to the load path.
