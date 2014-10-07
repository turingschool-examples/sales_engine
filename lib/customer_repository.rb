require_relative 'repository'

class CustomerRepository
  include Repository

  def initialize(customers)
    @entries = customers
    create_methods
  end
  
  private

  def attributes
    %w(id customer_id merchant_id status created_at updated_at)
  end
end
