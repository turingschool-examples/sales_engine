require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'stringio'
file_pattern = File.expand_path "../../lib/*.rb" , __FILE__

Dir[file_pattern].each { |file| require file }
