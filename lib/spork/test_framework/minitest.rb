class Spork::TestFramework::MiniTest < Spork::TestFramework
  DEFAULT_PORT = 8988
  HELPER_FILE = File.join(Dir.pwd, "test/test_helper.rb")

  def run_tests(argv, stderr, stdout)
    require "minitest/unit"
    $LOAD_PATH << "test" << "."
    ::MiniTest::Unit.output = stdout

    paths, opts = parse_options(argv)

    if defined? Turn
      turn_opts = {}
      opts.each_slice(2) { |opt| turn_opts[opt[0]] = opt[1] }

      config = Turn.config do |c|
        c.tests   = paths
        c.pattern = Regexp.new(turn_opts["-n"].gsub("/", "")) if turn_opts.has_key?("-n")
      end
      controller = Turn::Controller.new(config)
      controller.start
    else
      paths.each do |path|
        require path
      end

      ::MiniTest::Unit.new.run(opts)
    end
  end

  def parse_options(argv)
    paths, opts = argv.slice_before("--").to_a
    paths ||= []
    opts ||= []
    opts.shift
    [paths, opts]
  end
end
