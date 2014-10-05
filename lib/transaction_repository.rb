require_relative 'transaction'
require_relative 'finder_methods'
require 'csv'

class TransactionRepository
  include FinderMethods

  attr_reader :instances

  def initialize(directory)
    file =    File.join(directory, 'transactions.csv')
    data =    CSV.open(file, headers: true, header_converters: :symbol)
    @instances =  data.map { |row| Transaction.new(row.to_hash, self) }
  end
end
