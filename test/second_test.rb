require_relative "test_helper"

class SecondTest < MiniTest::Unit::TestCase
  def test_failure
    flunk "Everything is ok!"
  end
end
