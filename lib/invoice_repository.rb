<<<<<<< HEAD
require          'csv'
require_relative 'invoice'
require_relative 'items'
require_relative 'repository'
=======
require_relative 'invoice_repository_helper'
>>>>>>> 60647e6b3049b30aa7956fb3ef2fb85697e69e1b

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
