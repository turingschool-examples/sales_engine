require_relative 'repository'

class InvoiceItemRepository
  include Repository

  def initialize(invoice_items)
    @entries = invoice_items
    create_methods
  end

  private

  def attributes
    %w(id item_id invoice_id quantity unit_price created_at updated_at)
  end
end
