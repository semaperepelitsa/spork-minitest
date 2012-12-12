Gem::Specification.new do |s|
  s.name        = "spork-minitest"
  s.version     = "1.0.0.beta2"
  s.authors     = ["Semyon Perepelitsa"]
  s.email       = ["sema@sema.in"]
  s.homepage    = "https://github.com/semaperepelitsa/spork-minitest"
  s.summary     = "MiniTest runner for Spork"
  # s.description = %q{TODO: Write a gem description}

  s.executables   = ["testdrb"]
  s.files         = File.read('Manifest.txt').split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "spork"
end
