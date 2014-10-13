require_relative 'repository'
require_relative 'transaction'

class TransactionRepository < Repository
  attr_reader :repository, :sales_engine, :filepath

  def initialize(sales_engine, filepath)
    @sales_engine = sales_engine
    @repository = []
    @filepath = filepath
  end

  def inspect
    "#<#{self.class} #{@repository.size} rows>"
  end

  def make_repo
    populate_repository("#{filepath}/transactions.csv", Transaction)
  end

  def find_by_id(arg); find_by(:id, arg); end
  def find_by_invoice_id(arg); find_by(:invoice_id, arg); end
  def find_by_credit_card_number(arg); find_by(:credit_card_number, arg); end
  def find_by_credit_card_expiration_date(arg); find_by(:credit_card_expiration_date, arg); end
  def find_by_result(arg); find_by(:result, arg); end
  def find_by_created_at(arg); find_by(:created_at, arg); end
  def find_by_updated_at(arg); find_by(:updated_at, arg); end

  def find_all_by_id(arg); find_all_by(:id, arg); end
  def find_all_by_invoice_id(arg); find_all_by(:invoice_id, arg); end
  def find_all_by_credit_card_number(arg); find_all_by(:credit_card_number, arg); end
  def find_all_by_credit_card_expiration_date(arg); find_all_by(:credit_card_expiration_date, arg); end
  def find_all_by_result(arg); find_all_by(:result, arg); end
  def find_all_by_created_at(arg); find_all_by(:created_at, arg); end
  def find_all_by_updated_at(arg); find_all_by(:updated_at, arg); end

  def find_invoice_by_id(invoice_id)
    sales_engine.find_invoice_by_invoice_id(invoice_id)
  end
  
  def random
    repository.sample
  end
end
