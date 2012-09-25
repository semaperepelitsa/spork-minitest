require 'bundler/gem_tasks'
require "fileutils"

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

def testdrb args
  run "bundle exec testdrb #{args}"
end

def cd path, &block
  FileUtils.cd path, verbose: true, &block
end

task "test:unit" do
  cd "unit_project" do
    running "bundle exec spork minitest" do
      prompt_wait "Press return when spork is loaded"
      testdrb "test/first_test.rb"
      testdrb "test/first_test.rb test/second_test.rb"
      testdrb "test/first_test.rb -- -n test_false"
      testdrb "test/first_test.rb -- -n test_false -v"
    end
  end
end

task "test:spec" do
  cd "spec_project" do
    running({"HELPER_FILE" => "spec/spec_helper.rb"}, "bundle exec spork minitest") do
      prompt_wait "Press return when spork is loaded"
      testdrb "spec/some_spec.rb"
    end
  end
end

task :test => ["test:unit", "test:spec"]

task :default => :test
