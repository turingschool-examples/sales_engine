require_relative 'invoice_item'
require_relative 'finder_methods'
require 'csv'

class InvoiceItemRepository
  include FinderMethods

  attr_reader :instances, :engine

  def initialize(directory, engine)
    file =    File.join(directory, 'invoice_items.csv')
    data =    CSV.open(file, headers: true, header_converters: :symbol)
    @instances =  data.map { |row| InvoiceItem.new(row.to_hash, self) }
    @engine = engine
  end
end
