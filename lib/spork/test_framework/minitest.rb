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
    
    # MiniTest's test/unit does not support -I, -r, or -e
    # Extract them and remove from arguments that are passed to testrb.
    argv.each_with_index do |arg, idx|
      if arg =~ /-I(.*)/
        if $1 == ''
          # Path is next argument.
          include_path = argv[idx + 1]
          argv[idx + 1] = nil # Will be squashed when compact called.
        else
          include_path = $1
        end
        $LOAD_PATH << include_path
        argv[idx] = nil
      elsif arg =~ /-r(.*)/
        if $1 == ''
          # File is next argument.
          require_file = argv[idx + 1]
          argv[idx + 1] = nil # Will be squashed when compact called.
        else
          require_file = $1
        end
        require require_file
        argv[idx] = nil
      elsif arg =~ /^-e$/
        eval argv[idx + 1]
        argv[idx] = argv[idx + 1] = nil
      elsif arg == '--'
        argv[idx] = nil
        break
      elsif !arg.nil?
        require arg
        argv[idx] = nil
      end
    end
    argv.compact!

    ::MiniTest::Unit.new.run(argv)
  end
end
