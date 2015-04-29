require_relative 'customer'
require 'csv'

class CustomerRepository
  attr_reader :customers,
              :engine,
              :data

  def initialize(data, engine)
    @engine     = engine
    @data       = data
    @customers  = create_customers
  end

  def create_customers
    data.map do |attributes|
      Customer.new(attributes, self)
    end
  end

  def inspect
    "#<#{self.class} #{@customers.size} rows>"
  end

  def all
    customers
  end

  def find_invoices_by_customer_id(id)
    engine.invoice_repository.find_all_by_customer_id(id)
  end

  def customers_with_pending_invoices(invoice)
    find_all_by_id(invoice.customer_id)
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
