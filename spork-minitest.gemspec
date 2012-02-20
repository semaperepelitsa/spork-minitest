Gem::Specification.new do |s|
  s.name        = "spork-minitest"
  s.version     = "0.0.1"
  s.authors     = ["Semyon Perepelitsa"]
  s.email       = ["sema@sema.in"]
  # s.summary     = %q{Adds bank sources to Money gem}
  # s.description = %q{TODO: Write a gem description}

  s.executables   = ["testdrb"]
  s.files         = ["bin/testdrb", 'lib/spork/test_frameworks/minitest.rb']
  s.require_paths = ["lib"]

  s.add_dependency "spork"
end
