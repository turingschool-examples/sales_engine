require_relative 'customer'
require_relative 'finder_methods'
require 'csv'

class CustomerRepository
  include FinderMethods

  attr_reader :instances, :engine

  def initialize(directory, engine)
    file =    File.join(directory, 'customers.csv')
    data =    CSV.open(file, headers: true, header_converters: :symbol)
    @instances =  data.map { |row| Customer.new(row.to_hash, self) }
    @engine = engine
  end
end
