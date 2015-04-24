require 'csv'
require_relative 'customer'
require_relative 'sales_engine'

class CustomerRepository
  attr_accessor :customers
  attr_reader :engine, :data

  def initialize(data, engine)
    @engine = engine
    @data = data
    @customers ||= create_customers
  end

  def load_data
    @customers ||= create_customers
  end

  # def contents
  #   CSV.open "./data/customers.csv", headers: true, header_converters: :symbol
  # end

  def create_customers
    # puts "READING CUSTOMERS"
    data.map do |attributes|
      Customer.new(attributes, self)
    end
  end

  def all
    customers
  end

  def find_invoice_by_customer_id(id)
    engine.invoice_repo.find_all_by_customer_id(id)
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
