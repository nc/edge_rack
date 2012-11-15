# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "edge_rack"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["nc", "bmalet"]
  s.date = "2012-11-15"
  s.description = "Connects your rack app to Edge (http://getedge.io) so you can live edit stylesheets within your app"
  s.email = "support@mech.io"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "lib/edge_rack.rb",
    "lib/edge_rack/middleware.rb",
    "lib/edge_rack/railtie.rb"
  ]
  s.homepage = "http://github.com/nc/edge_rack"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Edge plugin for rack apps"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
    else
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
  end
end

