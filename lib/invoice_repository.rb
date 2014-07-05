require          'csv'
require_relative 'invoice'
require_relative 'repository'

class InvoiceRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @objects << Invoice.new(row)
    end
  end

  attr_reader :objects

end
