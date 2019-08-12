lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "warpera/version"

def load_git_files
  Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
end

Gem::Specification.new do |s|
  s.name                  = "warpera"
  s.version               = Warpera::VERSION
  s.author                = "Nolan Prochnau"
  s.email                 = ["parvus.mortalis@gmail.com"]
  s.summary               = "A gem that makes working with years in different eras palatable"
  s.homepage              = "https://github.com/parmort/warpera"
  s.license               = "MIT"
  s.files                 = load_git_files
  s.bindir                = "exe"
  s.executables           = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths         = ["lib"]
  s.required_ruby_version = '~> 2'
  s.extra_rdoc_files      = ['README.md']

  s.metadata = {
    "bug_tracker_uri"   => "https://github.com/parmort/warpera/issues",
    "changelog_uri"     => "https://github.com/parmort/warpera/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://www.example.info/gems/bestgemever/0.0.1",
    "homepage_uri"      => "https://github.com/parmort/warpera",
    "source_code_uri"   => "https://github.com/parmort/warpera"
  }

  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "fivemat"
end
