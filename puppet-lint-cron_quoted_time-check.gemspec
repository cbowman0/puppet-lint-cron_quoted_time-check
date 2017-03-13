Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-cron_quoted_time-check'
  spec.version     = '0.9.0'
  spec.homepage    = 'https://github.com/cbowman0/puppet-lint-cron_quoted_time-check'
  spec.license     = 'MIT'
  spec.author      = 'Christopher Bowman'
  spec.email       = 'cbowman0@gmail.com'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'A puppet-lint plugin to check file endings.'
  spec.description = <<-EOF
    A puppet-lint plugin to check that manifest files end with a newline.
  EOF

  spec.add_dependency             'puppet-lint', '~> 2.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'rspec-json_expectations'
  spec.add_development_dependency 'rake'
end

