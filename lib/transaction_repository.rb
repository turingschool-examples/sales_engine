require_relative 'transaction_repository_helper'

class TransactionRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) { |row| objects << Transaction.new(row) }
    new(objects)
  end

end
