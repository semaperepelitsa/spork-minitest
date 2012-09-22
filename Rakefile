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
  puts "=" * 30
  puts command
  system command
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
