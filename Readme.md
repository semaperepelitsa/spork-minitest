spork-minitest
==============

MiniTest runner for [Spork](https://github.com/sporkrb/spork).
A successor to [spork-testunit](https://github.com/sporkrb/spork-testunit)
with the following differences: 

* Supports only Ruby 1.9.

* Allows passing any options to MiniTest.

  Normally you pass them right at the end:
  
  `ruby test/test_first.rb --seed 12345 -n test_truth`
  
  When using testdrb you pass them after a double dash:
  
  `testdrb test/first_test.rb -- --seed 12345 -n test_truth`

* Exits with proper code (0 for success, 1 for failure).

  Some automated test running tools like Autotest and Guard
  rely on this to detect test failure.

* Does not support -I option to modify load path.


Usage
-----

Add it to your gemfile.

    gem "spork-minitest", "~> 1.0.0.beta1"

Install spork into your test helper using the following command or manually.

    spork minitest --bootstrap

Start `spork` and run your tests using `testdrb`. Some examples:

    testdrb test/integration_test.rb
    testdrb test/integration_test.rb -- --seed 1234
    SPORK_PORT=8989 testdrb test/integration_test.rb

If you do `require 'test_helper'` in every test you will get `LoadError: cannot load such file -- test_helper`.
To fix that add the following to the very top of your test helper:

    $LOAD_PATH << "test"

### Different test helper

You can specify different test helper when starting spork and run tests as usual.

    HELPER_FILE=spec/spec_helper.rb spork minitest

### [Autotest][]

You can run all tests over Spork by adding the following lines to your .autotest file.

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

[Autotest]: https://github.com/seattlerb/zentest

### License

Spork-MiniTest is released under the [MIT License](http://www.opensource.org/licenses/MIT).
