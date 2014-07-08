require          'csv'
require_relative 'invoice_item'
require_relative 'repository'

class InvoiceItemRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      objects << InvoiceItem.new(row)
    end
    new(objects)
  end

  attr_reader :objects

end
