class Spork::TestFramework::MiniTest < Spork::TestFramework
  DEFAULT_PORT = 8988
  HELPER_FILE = File.join(Dir.pwd, "test/test_helper.rb")

  def run_tests(argv, stderr, stdout)
    require "minitest/unit"
    $LOAD_PATH << "test" << "."
    
    io_class = ::MiniTest::Unit.output.class
    if defined?(PrideIO) and io_class == PrideIO or defined?(PrideLOL) and io_class == PrideLOL
      # Respect minitest/pride
      ::MiniTest::Unit.output = io_class.new(stdout)
    else
      ::MiniTest::Unit.output = stdout
    end

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
