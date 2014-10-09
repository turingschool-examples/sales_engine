require_relative 'repository'

class CustomerRepository
  include Repository

  def initialize(customers)
    @entries = customers
    create_methods
  end

  def give_invoices_from(invoice_repository)
  	entries.each do |customer|
  		customer.give_invoices(invoice_repository.find_all_by_customer_id(customer.id))
  	end
  end

  private

  def attributes
    %w(id first_name last_name created_at updated_at)
  end
end
