
require_relative 'invoice_repository_helper'


class InvoiceRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
       objects << Invoice.new(row)
     end
    new(objects)
  end

  attr_reader :objects

  def create(data)
    objects << Invoice.new(data) << Item.new(data[:items])
  end

end
