require_relative 'customer_entry'
require_relative 'parser'

class CustomerRepository
  extend Parser

  def self.collection
    @collection ||= load_entries(Customer, 'customers.csv')
  end

end


