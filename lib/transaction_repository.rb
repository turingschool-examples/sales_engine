require_relative 'transaction'
require_relative 'parser'

class TransactionRepository
  extend Parser

  def self.collection
    @collection ||= load_entries(Transaction, 'transactions.csv')
  end

end

