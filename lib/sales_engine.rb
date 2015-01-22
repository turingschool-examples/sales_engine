require 'csv'
require 'pry'
require_relative 'customer'
require_relative 'customer_repository'
require_relative 'customer_parser'

class SalesEngine
  def initialize(path_to_csvs="#{Dir.pwd}/data/")
    @data_path = path_to_csvs
  end

  def customer_repository
    @customer_repository ||= CustomerRepository.new
  end

  def startup
    CustomerParser.parse(File.join(@data_path, "customers.csv"), customer_repository)
  end
end
