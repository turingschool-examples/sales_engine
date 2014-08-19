require_relative 'customer'
require_relative 'repository'
require_relative 'parser'

class CustomerRepository < Repository
  extend Parser

  def self.collection
    @collection ||= load_entries(Customer, 'customers.csv')
  end
end


#define_method - look at for high level find_by_x
