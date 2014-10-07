require_relative 'repository'
require_relative 'invoice'

class InvoiceRepository < Repository

  attr_reader :repo
  def initialize
    @repo = []
  end

  def find_by_id(arg); finder(:id, arg); end
  def find_by_customer_id(arg); finder(:customer_id, arg); end
  def find_by_merchant_id(arg); finder(:merchant_id, arg); end
  def find_by_status(arg); finder(:status, arg); end
  def find_by_created_at(arg); finder(:created_at, arg); end
  def find_by_updated_at(arg); finder(:updated_at, arg); end

end
