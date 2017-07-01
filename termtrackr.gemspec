# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "termtrackr/version"

Gem::Specification.new do |spec|
  spec.name          = "termtrackr"
  spec.version       = Termtrackr::VERSION
  spec.authors       = ["Halis Duraki"]
  spec.email         = ["duraki@linuxmail.org"]

  spec.summary       = %q{Record and listen from MT/Intel WebSocket for caught malwares.}
  spec.description   = %q{This gem parse and extract message from MalwareTech Intel ws and allows you to reuse the data.}
  spec.homepage      = "https://github.com/duraki/termtrackr"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rmagick'
  spec.add_dependency 'faye-websocket'
  spec.add_dependency 'geocoder'
  spec.add_dependency 'worldize'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
