require_relative 'repository'

class InvoiceRepository
  include Repository

  def initialize(invoices)
    @entries = invoices
    create_methods
  end

  private

  def attributes
    %w(id customer_id merchant_id status created_at updated_at)
  end
end
