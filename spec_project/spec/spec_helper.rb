require "spork"
$LOAD_PATH << "spec"

Spork.prefork do
  require "minitest/spec"
end
