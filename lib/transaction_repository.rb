require 'csv'
require_relative 'transaction'

class TransactionRepository
  attr_accessor :transactions
  attr_reader :engine, :data

  def initialize(data, engine)
    @engine = engine
    @data = data
    @transactions ||= create_transactions
  end

  def load_data
    @transactions ||= create_transactions
  end

  # def contents
  #   CSV.open "./data/transactions.csv", headers: true, header_converters: :symbol
  # end

  def create_transactions
    # puts "READING TRANSACTIONS"
    data.map do |attributes|
      Transaction.new(attributes, self)
    end
  end

  def find_invoice_by_invoice_id(invoice_id)
    engine.invoice_repo.find_by_id(invoice_id)
  end

  def all
    transactions
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
