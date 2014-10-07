require 'simplecov'
SimpleCov.start
gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
