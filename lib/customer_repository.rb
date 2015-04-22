require 'csv'
require_relative "customer"
require 'pry'

class CustomerRepository
  attr_accessor :customers

  def make_customers_array
    contents = CSV.open "./data/customers.csv", headers: true, header_converters: :symbol


    @customers = contents.map do |row|
                    customer = Customer.new
                    customer.id = row[:id]
                    customer.first_name = row[:first_name]
                    customer.last_name = row[:last_name]
                    customer.created_at = row[:created_at]
                    customer.updated_at = row[:updated_at]
                    customer
                end
  end

  def random
    @customers.sample
  end

  def find_by_first_name(first_name)
    @customers.find { |customer| customer.first_name == first_name }
  end

  def find_all_by_first_name(first_name)
    @customers.select { |customer| customer.first_name == first_name }
  end

  def find_by_last_name(last_name)
    @customers.find { |customer| customer.last_name == last_name }
  end

  def find_all_by_last_name(last_name)
    @customers.select { |customer| customer.last_name == last_name }
  end

end

c = CustomerRepository.new
c.make_customers_array

puts c.find_by_first_name("Ashly")

