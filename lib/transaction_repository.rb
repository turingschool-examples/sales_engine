require 'csv'
require_relative 'transaction_entry'
require_relative 'repository'

class TransactionRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @objects << TransactionEntry.new(row)
    end
  end

  attr_reader :objects

end
