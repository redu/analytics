# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "redu_analytics/version"

Gem::Specification.new do |s|
  s.name        = "redu_analytics"
  s.version     = ReduAnalytics::VERSION
  s.authors     = ["Guilherme Cavalcanti"]
  s.email       = ["guiocavalcanti@gmail.com"]
  s.homepage    = ""
  s.summary     = "Redu related analytics"
  s.description = "This gem generates some graphs that show Redu's entities usage"

  s.rubyforge_project = "redu_analytics"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "activerecord", "~> 3.0.10"
  s.add_development_dependency "activesupport", "~> 3.0.10"

  s.add_runtime_dependency "lazy_high_charts"
end
