class Spork::TestFramework::MiniTest < Spork::TestFramework
  DEFAULT_PORT = 8988
  HELPER_FILE = File.join(Dir.pwd, "test/test_helper.rb")

  def run_tests(argv, stderr, stdout)
    require "minitest/unit"
    $LOAD_PATH << "test"
    ::MiniTest::Unit.output = stdout

    sep = '--'
    paths = argv.take_while{ |arg| arg != sep }
    args = argv.drop_while{ |arg| arg != sep }
    args.shift

    paths.each do |path|
      next if path.start_with?("-")
      load File.expand_path(path)
    end
    ::MiniTest::Unit.new.run(args)
  end
end
