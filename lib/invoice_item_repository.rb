require_relative 'invoice_item'
require_relative 'repository'
require_relative 'parser'

class InvoiceItemRepository < Repository
  extend Parser

  def self.collection
    @collection ||= load_entries(InvoiceItem, 'invoice_items.csv')
  end

end
