$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "engine2/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "engine2"
  s.version     = Engine2::VERSION
  s.authors     = ["Sebastian Osuna"]
  s.email       = ["jsebastianosuna@hotmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Engine1."
  s.description = "Description of Engine1."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "bunny"

  s.add_development_dependency "sqlite3"

end
