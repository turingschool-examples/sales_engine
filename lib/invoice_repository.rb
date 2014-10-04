require_relative 'invoice'
require 'csv'

class InvoiceRepository
  attr_reader :invoices

  def self.load_invoices(directory)
    file = File.join(directory, 'invoices.csv')
    data = CSV.open(file, headers: true, header_converters: :symbol)
    rows = data.map do |row|
      Invoice.new(row)
    end
    new(rows) # => InvoiceRepository.new(rows)
  end

  def initialize(invoices)
    @invoices = invoices
  end

  # def all
  #   merchants
  # end
  #
  # def random
  #   merchants.sample
  # end
  #
  # def find_by_x(match)
  #
  # end
  #
  # def find_all_by_x(match)
  #
  # end
end
