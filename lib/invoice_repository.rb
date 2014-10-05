require_relative 'invoice'
require_relative 'finder_methods'
require 'csv'

class InvoiceRepository
  include FinderMethods

  attr_reader :instances

  def initialize(directory)
    file =    File.join(directory, 'invoices.csv')
    data =    CSV.open(file, headers: true, header_converters: :symbol)
    @instances =  data.map { |row| Invoice.new(row.to_hash, self) }
  end
end
