require "minitest/autorun"

module Spork
  class TestFramework
  end
end

require "spork/test_framework/minitest"

class TestParseOptions < MiniTest::Unit::TestCase
  def test_full
    assert_equal [%w[foo bar], %w[--seed 123]], parse_options(%w[foo bar -- --seed 123])
  end

  def test_only_paths
    assert_equal [%w[foo bar], []], parse_options(%w[foo bar])
  end

  def parse_options(*args, &block)
    @runner ||= Spork::TestFramework::MiniTest.new
    @runner.parse_options(*args, &block)
  end
end

