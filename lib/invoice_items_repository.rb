require          'csv'
require_relative 'invoice_items_entry'
require_relative 'repository'

class InvoiceItemsRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @objects << InvoiceItemsEntry.new(row)
    end
  end

  attr_reader :objects

end
