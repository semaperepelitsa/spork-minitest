class Spork::TestFramework::MiniTest < Spork::TestFramework
  DEFAULT_PORT = 8988
  HELPER_FILE = File.join(Dir.pwd, "test/test_helper.rb")

  def run_tests(argv, err, out)
    $stderr = err
    $stdout = out

    paths, opts = parse_options(argv)

    paths.each do |path|
      require File.join(Dir.pwd, path)
    end

    MiniTest::Unit.runner.run(opts)
  end

  def parse_options(argv)
    paths, opts = argv.slice_before("--").to_a
    paths ||= []
    opts ||= []
    opts.shift
    [paths, opts]
  end
end
