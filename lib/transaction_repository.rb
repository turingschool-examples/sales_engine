require_relative 'transaction_repository_helper'

class TransactionRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      objects << Transaction.new(row)
    end
    new(objects)
  end

end
