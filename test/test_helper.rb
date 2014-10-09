require 'simplecov'
SimpleCov.start
gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
