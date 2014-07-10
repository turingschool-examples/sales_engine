require_relative 'invoice_item_repository_helper'

class InvoiceItemRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
       objects << InvoiceItem.new(row)
     end
    new(objects)
  end

end
