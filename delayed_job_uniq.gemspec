
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "delayed_job_uniq/version"

Gem::Specification.new do |spec|
  spec.name          = "delayed_job_uniq"
  spec.version       = DelayedJobUniq::VERSION
  spec.authors       = ["Esteban Debole"]
  spec.email         = ["estebandebole@gmail.com"]

  spec.summary       = "Delayed Job Uniq"
  spec.description   = "Enqueue just one job with the same key"
  spec.homepage      = "https://sinaptia.dev"
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/sinaptia/delayed_job_uniq"
    spec.metadata["changelog_uri"] = "https://github.com/sinaptia/delayed_job_uniq"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/|\.gem$}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "delayed_job_active_record", "~> 4.1", ">= 4.1.7"
  spec.add_development_dependency "rspec", "~> 3.0"
end
