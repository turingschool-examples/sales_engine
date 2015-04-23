require 'csv'
require_relative 'customer'

class CustomerRepository
  attr_accessor :customers

  def initialize
    @customers = create_customers
  end

  def contents
    CSV.open "./fixtures/customers.csv", headers: true, header_converters: :symbol
  end

  def create_customers
    contents.map do |row|
      customer            = Customer.new
      customer.id         = row[:id]
      customer.first_name = row[:first_name]
      customer.last_name  = row[:last_name]
      customer.created_at = row[:created_at]
      customer.updated_at = row[:updated_at]
      customer
    end
  end

  def random
    customers.sample
  end

  def find_by_id(id)
    customers.detect { |customer| customer.id == id }
  end

  def find_all_by_id(id)
    customers.select { |customer| customer.id == id }
  end

  def find_by_first_name(first_name)
    customers.detect { |customer| customer.first_name == first_name }
  end

  def find_all_by_first_name(first_name)
    customers.select { |customer| customer.first_name == first_name }
  end

  def find_by_last_name(last_name)
    customers.detect { |customer| customer.last_name == last_name }
  end

  def find_all_by_last_name(last_name)
    customers.select { |customer| customer.last_name == last_name }
  end

  def find_by_created_at(created_at)
    customers.detect { |customer| customer.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    customers.select { |customer| customer.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    customers.detect { |customer| customer.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    customers.select { |customer| customer.updated_at == updated_at }
  end
end
