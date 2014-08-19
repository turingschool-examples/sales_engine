require_relative 'transaction'
require_relative 'repository'
require_relative 'parser'

class TransactionRepository < Repository
  extend Parser

  def self.collection
    @collection ||= load_entries(Transaction, 'transactions.csv')
  end

end
