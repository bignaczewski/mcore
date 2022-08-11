# frozen_string_literal: true

require_relative 'lib/mcore/version'

Gem::Specification.new do |spec|
  spec.name        = 'mcore'
  spec.version     = Mcore::VERSION
  spec.authors     = ['Bartosz Ignaczewski']
  spec.email       = ['bignaczewski@advicefront.com']
  # spec.homepage    = ""
  spec.summary     = 'Summary of mCore.'
  spec.description = 'Description of mCore.'
  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.required_ruby_version = '>= 2.7.0'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'draper', '~> 4.0.0'
  spec.add_dependency 'interactor', "~> 3.0"
  spec.add_dependency 'rails', '>= 7.0.3.1'

  spec.add_development_dependency 'better_errors'
  spec.add_development_dependency 'binding_of_caller'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'database_cleaner-active_record'
  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'letter_opener'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop-rails'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'shoulda-matchers'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
