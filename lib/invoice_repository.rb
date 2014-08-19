require_relative 'invoice'
require_relative 'parser'

class InvoiceRepository
  extend Parser

  def self.collection  
    @collection ||= load_entries(Invoice, 'invoices.csv')
  end

end
