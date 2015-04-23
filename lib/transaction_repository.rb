require 'csv'
require_relative 'transaction'

class TransactionRepository
  attr_accessor :transactions

  def initialize
    @transactions = create_transactions
  end

  def contents
    CSV.open "./data/transactions.csv", headers: true, header_converters: :symbol
  end

  def create_transactions
    contents.map do |row|
      transaction                    = Transaction.new
      transaction.id                 = row[:id]
      transaction.invoice_id         = row[:invoice_id]
      transaction.cc_number          = row[:credit_card_number]
      transaction.cc_expiration_date = row[:credit_card_expiration_date]
      transaction.result             = row[:result]
      transaction.created_at         = row[:created_at]
      transaction.updated_at         = row[:updated_at]
      transaction
    end
  end

  def random
    transactions.sample
  end

  def find_by_id(id)
    transactions.detect { |transaction| transaction.id == id }
  end

  def find_all_by_id(id)
    transactions.select { |transaction| transaction.id == id}
  end

  def find_by_invoice_id(invoice_id)
    transactions.detect { |transaction| transaction.invoice_id == invoice_id }
  end

  def find_all_by_invoice_id(invoice_id)
    transactions.select { |transaction| transaction.invoice_id == invoice_id}
  end

  def find_by_cc_number(cc_number)
    transactions.detect { |transaction| transaction.cc_number == cc_number}
  end

  def find_all_by_cc_number(cc_number)
    transactions.select { |transaction| transaction.cc_number == cc_number}
  end

  def find_by_cc_expiration_date(cc_expiration_date)
    transactions.detect { |transaction| transaction.cc_expiration_date == cc_expiration_date}
  end

  def find_all_by_cc_expiration_date(cc_expiration_date)
    transactions.select { |transaction| transaction.cc_expiration_date == cc_expiration_date}
  end

  def find_by_result(result)
    transactions.detect { |transaction| transaction.result == result}
  end

  def find_all_by_result(result)
    transactions.select { |transaction| transaction.result == result}
  end

  def find_by_created_at(created_at)
    transactions.detect { |transaction| transaction.created_at == created_at}
  end

  def find_all_by_created_at(created_at)
    transactions.select { |transaction| transaction.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    transactions.detect { |transaction| transaction.updated_at == updated_at}
  end

  def find_all_by_updated_at(updated_at)
    transactions.select { |transaction| transaction.updated_at == updated_at}
  end

end
