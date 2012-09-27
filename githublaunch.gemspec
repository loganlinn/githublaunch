# -*- encoding: utf-8 -*-
require File.expand_path('../lib/githublaunch/version', __FILE__)

Gem::Specification.new do |s|
  s.name = "githublaunch"
  s.authors = ['Logan Linn']
  s.description = %q{A CLI command for launching Github URLs}
  s.summary = s.description
  s.email = 'logan@loganlinn.com'
  s.homepage = "https://github.com/loganlinn/githublaunch"
  s.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  s.files = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.version = GithubLaunch::VERSION

  s.add_dependency 'thor'
  s.add_dependency 'grit'
end
