require 'bundler/gem_tasks'

def running(*args)
  pid = spawn(*args)
  yield
ensure
  Process.kill :INT, pid
end

def prompt_wait message = nil
  puts message
  $stdin.gets
end

def run command
  puts command
  out_rd, out_wr = IO.pipe
  system command, out: out_wr
  out_wr.close
  puts "-" * 30, "Output:", out_rd.read, "-" * 30
end

task :test do
  running "bundle exec spork minitest" do
    prompt_wait "Press return when spork is loaded"
    run "bin/testdrb test/first_test.rb"
    run "bin/testdrb test/first_test.rb test/second_test.rb"
    run "bin/testdrb test/first_test.rb -- -n test_false"
    run "bin/testdrb test/first_test.rb -- -n test_false -v"
  end
end

task :default => :test
