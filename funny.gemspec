lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'funny/version'

Gem::Specification.new do |spec|
  spec.name          = 'funny'
  spec.version       = Funny::VERSION
  spec.authors       = ['JohnnyTing']
  spec.email         = ['JohnnyTing2DingXu@gmail.com']

  spec.summary       = "this gem generates a Microsoft Word document(.docx) which include tables's metadata from database"
  spec.description   = "this gem generates a Microsoft Word document(.docx) which include tables's metadata from database"
  spec.homepage      = 'https://github.com/JohnnyTing/funny.'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables << 'funny'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'activerecord-postgis-adapter', '~> 6.0'
  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'pg', '>= 0.18', '< 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rgeo-activerecord', '~> 6.2', '>= 6.2.1'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'activerecord', '>= 6.0.0'
  spec.add_dependency 'caracal'
  spec.add_dependency 'thor'
end
