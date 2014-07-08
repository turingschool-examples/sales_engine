require          'csv'
require_relative 'invoice'
require_relative 'repository'

class InvoiceRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      objects << Invoice.new(row)
    end
    new(objects)
  end

  attr_reader :objects





end
