require 'csv'

class Customer
  attr_accessor :attributes
  def initialize(attributes)
    self.attributes = attributes
  end

  def first_name
    attributes[:first_name]
  end
end

class CustomerRepository
  def initialize(data_dir)
    hashes = CSV.read "#{data_dir}/customers.csv",
                      headers:            true,
                      header_converters: :symbol
    @all = hashes.map { |hash| Customer.new hash.to_hash }
  end

  def find_all_by_first_name(first_name)
    @all.select { |customer| customer.first_name == first_name }
  end
end

class SalesEngine
  def initialize(data_dir)
    @data_dir = data_dir
  end

  attr_accessor :customer_repository

  def startup
    @customer_repository = CustomerRepository.new(@data_dir)
  end
end
