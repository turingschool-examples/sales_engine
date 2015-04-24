require_relative 'sales_engine'

class InvoiceItem
  attr_accessor :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at
  attr_reader :repo

  def initialize(attributes, repo)
    @repo       = repo
    @id         = attributes[:id]
    @item_id    = attributes[:item_id]
    @invoice_id = attributes[:invoice_id]
    @quantity   = attributes[:quantity]
    @unit_price = attributes[:unit_price]
    @created_at = attributes[:created_at]
    @updated_at = attributes[:updated_at]
  end

  def invoice
    repo.find_invoice_by_invoice_id(invoice_id)
  end

  def item
    repo.find_item_by_item_id(item_id)
  end
end
