spork-minitest
==============

MiniTest runner for [Spork](https://github.com/sporkrb/spork).
A successor to [spork-testunit](https://github.com/sporkrb/spork-testunit)
with the following differences: 

* Supports only Ruby 1.9.

* Allows passing any options to MiniTest.

  Normally you pass them right at the end:
  
  `ruby test/test_first.rb --seed 12345 -n test_truth`
  
  When using testdrb you pass them after double dash:
  
  `testdrb test/first_test.rb -- --seed 12345 -n test_truth`

* Exits with proper code (0 for success, 1 for failure).

  Some automated test running tools like Autotest and Guard
  rely on this to detect test failure.

* Does not support -I option, hardcoded to add `.` and `test` to the load path.

Usage
-----

Add it to your gemfile.

    gem "spork-minitest", "~> 0.0.2"

Install spork into your test helper using the following command or manually.

    spork minitest --bootstrap

Start `spork` and run your tests using `testdrb`.

    testdrb test/integration_test.rb

If you use [Autotest](https://github.com/seattlerb/zentest) you can run
all tests over Spork by adding the following lines to your .autotest file.

    class Autotest
      # run tests over drb server (spork)
      def make_test_cmd files_to_test
        if files_to_test.empty?
          "" # no tests to run
        else
          "bin/testdrb #{files_to_test.keys.join(' ')}"
        end
      end
    end
