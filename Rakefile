# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "edge_rack"
  gem.homepage = "http://github.com/nc/edge_rack"
  gem.license = "MIT"
  gem.summary = %Q{Edge plugin for rack apps}
  gem.description = %Q{Connects your rack app to Edge (http://getedge.io) so you can live edit stylesheets within your app}
  gem.email = "support@mech.io"
  gem.authors = ["nc", "bmalet"]
  gem.files = Dir.glob('lib/**/*.rb')

  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new