require_relative 'repository'

class InvoiceItemRepository
  include Repository

  def initialize(invoice_items)
    @entries = invoice_items
    create_methods
  end

  def give_invoices_from(invoice_repo)
    @entries.each do |invoice_item|
      invoice_item.give_invoice(invoice_repo.find_by_id(invoice_item.invoice_id))
    end
  end

  def give_items_from(item_repo)
    @entries.each do |invoice_item|
      invoice_item.give_item(item_repo.find_by_id(invoice_item.item_id))
    end
  end

  private

  def attributes
    %w(id item_id invoice_id quantity unit_price created_at updated_at)
  end
end
