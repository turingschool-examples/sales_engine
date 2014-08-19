require_relative 'customer'
require_relative 'parser'

class CustomerRepository
  extend Parser

  def self.collection
    @collection ||= load_entries(Customer, 'customers.csv')
  end

end
