require_relative 'invoice_item_repository_helper'

class InvoiceItemRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) { |row| objects << InvoiceItem.new(row) }
    new(objects)
  end

end
