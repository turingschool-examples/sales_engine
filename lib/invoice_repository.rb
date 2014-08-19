require_relative 'invoice'
require_relative 'repository'
require_relative 'parser'

class InvoiceRepository < Repository
  extend Parser

  def self.collection
    @collection ||= load_entries(Invoice, 'invoices.csv')
  end

end
