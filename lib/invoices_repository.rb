require          'csv'
require_relative 'invoices_entry'
require_relative 'repository'

class InvoicesRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @objects << InvoiceEntry.new(row)
    end
  end

  attr_reader :objects

end
