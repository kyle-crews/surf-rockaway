
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "./lib/surf_data/version"

Gem::Specification.new do |spec|
  spec.name          = "surf_rockaway"
  spec.version       = SurfRockaway::VERSION
  spec.authors       = ["kyle crews"]
  spec.email         = ["dev.kylecrews@gmail.com"]

  spec.summary       = %q{ A Florida native for most of my life, moving to NYC over the summer
                        left me longing for the beach. I soon discovered Rockaway Beach is 
                        the closest surf spot to the city. (bonus you can take the water ferry!) 
                        All too often, I found myself lost in a terminal screen ... searching for 
                        an excuse to hit the beach for a few hours. So, I created surf-rockaway. 
                        This gem provides a quick way to check the current surf condtions without ever leaving the terminal }
  spec.description   = %q{ Simple ruby based CLI application to pull a surf report for Rockaway Beach, Queens, NY }
  spec.homepage      = "https://github.com/kyle-crews/surf-rockaway"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata["allowed_push_host"] = "http://mygemserver.com"
  #
  #
  #  spec.metadata["homepage_uri"] = spec.homepage
  #  spec.metadata["source_code_uri"] = "https://github.com/kyle-crews/surf-rockaway"
  #  spec.metadata["changelog_uri"] = "https://github.com/kyle-crews/surf-rockaway/blob/master/CHANGELOG.md"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  #end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
