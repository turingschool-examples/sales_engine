
require_relative 'invoice_repository_helper'


class InvoiceRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) { |row| objects << Invoice.new(row) }
    new(objects)
  end

  attr_reader :objects

  def create(data)

    objects << Invoice.new(data) << Item.new(data[:items])
  end

end
