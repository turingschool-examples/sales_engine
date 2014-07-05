require          'csv'
require_relative 'invoice_item'
require_relative 'repository'

class InvoiceItemRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @objects << InvoiceItem.new(row)
    end
  end

  attr_reader :objects

end
