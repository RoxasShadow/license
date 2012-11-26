Kernel.load 'lib/license/version.rb'

Gem::Specification.new { |s|
	s.name          = 'license'
	s.version       = License::version
	s.author        = 'Giovanni Capuano'
	s.email         = 'webmaster@giovannicapuano.net'
	s.homepage      = 'http://www.giovannicapuano.net'
	s.platform      = Gem::Platform::RUBY
	s.summary       = 'License generator'
	s.description   = 'Allows to get easily your preferred license for your sources.'
	s.require_paths = ['lib']
	s.files         = Dir.glob('lib/**/*.rb')
  s.executables   = 'license'
}