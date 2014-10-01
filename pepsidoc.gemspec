Gem::Specification.new do |gem|
  gem.name        = 'pepsidoc'
  gem.version     = '0.0.1'
  gem.date        = '2014-10-01'

  gem.summary     = 'Pepsidoc'
  gem.description = 'Security reportbase'
  gem.authors     = ['Harun Esur']
  gem.email       = 'harun.esur@sceptive.com'
  gem.homepage    = 'http://sceptive.com'
  gem.license     = 'MIT'
#  gem.requirements << 'Ruby should be compiled with openssl support.'

  gem.executables << 'pepsidoc'

  gem.files = `git ls-files`.split("\n")

  gem.add_runtime_dependency 'table_print'

  gem.add_development_dependency 'rubocop', '~> 0.26'
  gem.add_development_dependency 'rspec', '~> 3.0.0'
end
