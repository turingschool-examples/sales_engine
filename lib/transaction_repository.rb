require 'csv'
require_relative 'transaction'
require_relative 'repository'

class TransactionRepository < Repository


  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      objects << Transaction.new(row)
    end
    new(objects)
  end

  attr_reader :objects

end
