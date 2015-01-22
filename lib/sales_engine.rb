require 'csv'
require 'pry'
require_relative 'customer'
require_relative 'customer_repository'

class SalesEngine
  def initialize(path_to_csvs="#{Dir.pwd}/data/")
    @data_path = path_to_csvs
  end

  def customer_repository
    @customer_repository ||= CustomerRepository.new
  end

  def startup
    customer_repository.parse(File.join(@data_path, "customers.csv"))
  end
end
