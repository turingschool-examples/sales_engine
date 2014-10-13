require_relative 'repository'

class CustomerRepository
  include Repository

  def initialize(customers)
    @entries = customers
    create_methods
  end

  def set_relations(repo)
    set_invoices(repo.first)
  end

  def set_invoices(inv_repo)
    entries.each do |customer|
      customer.assign_invoices(inv_repo.find_all_by_customer_id(customer.id))
    end
  end

  private

  def attributes
    %w(id first_name last_name created_at updated_at)
  end
end
