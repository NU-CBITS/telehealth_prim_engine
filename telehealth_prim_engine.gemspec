$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "telehealth_prim_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "telehealth_prim_engine"
  s.version     = TelehealthPrimEngine::VERSION
  s.authors     = ["Eric Carty-Fickes"]
  s.email       = ["ericcf@northwestern.edu"]
  s.summary     = "Rails engine supporting Telehealth PRIM"
  s.description = "Rails engine supporting Telehealth PRIM"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile"]
  s.extra_rdoc_files = ["README.md"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "devise", "~> 3.4.1"

  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails", "~> 3.0"
  s.add_development_dependency "brakeman"
  s.add_development_dependency "rubocop", "~> 0.29"
  s.add_development_dependency "simplecov", "~> 0.9.1"
end
