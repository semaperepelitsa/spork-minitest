Gem::Specification.new do |s|
  s.name        = "spork-minitest"
  s.version     = "1.0.rc1"
  s.authors     = ["Semyon Perepelitsa"]
  s.email       = ["sema@sema.in"]
  s.homepage    = "https://github.com/semaperepelitsa/spork-minitest"
  s.summary     = "MiniTest runner for Spork"
  # s.description = %q{TODO: Write a gem description}

  s.executables   = ["testdrb"]
  s.files         = %w[
                      bin/testdrb
                      lib/spork/test_framework/minitest.rb
                      metatest/test_spork_minitest.rb
                      Readme.md
                      Changelog.md 
                    ]
  s.require_paths = ["lib"]

  s.add_dependency "spork"
end
