require_relative 'repository'
require_relative 'transaction'

class TransactionRepository < Repository

  attr_reader :repo

  def initialize
    @repo = []
  end

  def find_by_id(arg); finder(:id, arg); end
  def find_by_invoice_id(arg); finder(:invoice_id, arg); end
  def find_by_credit_card_number(arg); finder(:credit_card_number, arg); end
  def find_by_credit_card_expiration_date(arg); finder(:credit_card_expiration_date, arg); end
  def find_by_result(arg); finder(:result, arg); end
  def find_by_created_at(arg); finder(:created_at, arg); end
  def find_by_updated_at(arg); finder(:updated_at, arg); end

end
