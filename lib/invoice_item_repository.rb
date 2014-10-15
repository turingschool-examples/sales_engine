require_relative 'repository'

class InvoiceItemRepository
  include Repository

  def initialize(invoice_items)
    @entries = invoice_items
    create_methods
  end

  def set_relations(repositories)
    set_invoices(repositories[0])
    set_items(repositories[1])
  end

  def set_invoices(inv_repo)
    @entries.each do |invoice_item|
    invoice_item.assign_invoice(inv_repo.find_by_id(invoice_item.invoice_id))
    end
  end

  def set_items(item_repo)
    @entries.each do |invoice_item|
      invoice_item.assign_item(item_repo.find_by_id(invoice_item.item_id))
    end
  end

  private

  def attributes
    %w(id item_id invoice_id quantity unit_price created_at updated_at)
  end
end
