require "spork"
$LOAD_PATH << "test"

Spork.prefork do
  require "minitest/unit"
end
