$:.unshift File.expand_path("./../lib", __FILE__)

require 'bundler'
Bundler.require

ENV['RACK_ENV'] = 'development'

require 'app'

run CMS
