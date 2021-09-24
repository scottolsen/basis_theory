# frozen_string_literal: true

require_relative 'lib/basis_theory/version'

Gem::Specification.new do |spec|
  spec.name          = 'basis_theory'
  spec.version       = BasisTheory::VERSION
  spec.authors       = ['Scott Olsen']
  spec.email         = ['solsen300@gmail.com']

  spec.summary       = 'Ruby gem for the Basis Theory API.'
  spec.description   = 'Ruby gem for the Basis Theory API. API docs can be found here: https://docs.basistheory.com/api-reference/#introduction'
  spec.homepage      = 'https://github.com/scottolsen/basis_theory'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.5.0'

  spec.metadata['allowed_push_host'] = "TODO: Set to 'https://mygemserver.com'"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 1.8'
  spec.add_dependency 'faraday_middleware', '~> 1.1'
end
