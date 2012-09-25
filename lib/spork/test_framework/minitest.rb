class Spork::TestFramework::MiniTest < Spork::TestFramework
  DEFAULT_PORT = 8988
  HELPER_FILE = File.join(Dir.pwd, %w[spec/spec_helper.rb test/test_helper.rb].find { |f| File.exists?(f) })

  def run_tests(argv, stderr, stdout)
    require "minitest/unit"
    $LOAD_PATH << "test" << "."
    $LOAD_PATH << "spec" if File.directory?(File.join(Dir.pwd, 'spec'))
    ::MiniTest::Unit.output = stdout

    paths, opts = parse_options(argv)

    paths.each do |path|
      require path
    end

    ::MiniTest::Unit.new.run(opts)
  end

  def parse_options(argv)
    paths, opts = argv.slice_before("--").to_a
    paths ||= []
    opts ||= []
    opts.shift
    [paths, opts]
  end
end
