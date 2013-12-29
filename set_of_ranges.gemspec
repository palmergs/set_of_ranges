# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'set_of_ranges/version'

Gem::Specification.new do |gem|
  gem.name          = "set_of_ranges"
  gem.version       = SetOfRanges::VERSION
  gem.authors       = ["Galen Palmer"]
  gem.email         = ["palmergs@gmail.com"]
  gem.description   = %q{A subclass of Set that attempts to merge overlapping or adjacent Range values.}
  gem.summary       = %q{Developed to enable iteration through a set of discontiguous ranges.}
  gem.homepage      = "https://github.com/palmergs/set_of_ranges"
 
  gem.rubyforge_project = 'set_of_ranges'

  gem.files         = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  gem.test_files    = Dir['{spec}/**/*']
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rspec', '~> 2.10'

end
