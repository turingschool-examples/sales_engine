require_relative 'transaction'
require 'csv'

class TransactionRepository
  attr_reader :transactions,
              :engine,
              :data

  def initialize(data, engine)
    @engine       = engine
    @data         = data
    @transactions = create_transactions
  end

  def create_transactions
    data.map do |attributes|
      Transaction.new(attributes, self)
    end
  end

  def find_invoice_by_invoice_id(invoice_id)
    engine.invoice_repository.find_by_id(invoice_id)
  end

  def inspect
    "#<#{self.class} #{transactions.size} rows>"
  end

  def all
    transactions
  end

  def random
    transactions.sample
  end

  def successful_transactions
    find_all_by_result("success")
  end

  def grouped_by_invoice_id
    transactions.group_by { |transaction| transaction.invoice_id }
  end

  def pending_transactions
    grouped_by_invoice_id.delete_if { |key, value| value.include? "success" }
  end

  def find_by_id(id)
    transactions.detect { |transaction| transaction.id == id }
  end

  def find_all_by_id(id)
    transactions.select { |transaction| transaction.id == id }
  end

  def find_by_invoice_id(invoice_id)
    transactions.detect { |transaction| transaction.invoice_id == invoice_id }
  end

  def find_all_by_invoice_id(invoice_id)
    transactions.select { |transaction| transaction.invoice_id == invoice_id }
  end

  def find_by_credit_card_number(cc_number)
    transactions.detect { |transaction| transaction.cc_number == cc_number }
  end

  def find_all_by_credit_card_number(cc_number)
    transactions.select { |transaction| transaction.cc_number == cc_number }
  end

  def find_by_cc_expiration_date(cc_expiration_date)
    transactions.detect do |transaction|
      transaction.cc_expiration_date == cc_expiration_date
    end
  end

  def find_all_by_cc_expiration_date(cc_expiration_date)
    transactions.select do |transaction|
      transaction.cc_expiration_date == cc_expiration_date
    end
  end

  def find_by_result(result)
    transactions.detect { |transaction| transaction.result == result }
  end

  def find_all_by_result(result)
    transactions.select { |transaction| transaction.result == result }
  end

  def find_by_created_at(created_at)
    transactions.detect { |transaction| transaction.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    transactions.select { |transaction| transaction.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    transactions.detect { |transaction| transaction.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    transactions.select { |transaction| transaction.updated_at == updated_at }
  end
end
