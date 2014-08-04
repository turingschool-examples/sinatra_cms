require 'bundler'
Bundler.require

task :test do
  Dir.glob('./test/**/*_test.rb') { |file| require file }
end

task :setup do
  require './test/setup_database'
  setup = SetupDatabase.new
  setup.go
end

task :console do
  ENV['RACK_ENV'] = 'development'
  require './lib/app'
  binding.pry
end

task :server do
  `RACK_ENV=development shotgun`
end
