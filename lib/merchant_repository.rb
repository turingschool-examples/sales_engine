require 'csv'
require_relative 'merchant'
require_relative 'sales_engine'

class MerchantRepository
  attr_accessor :merchants
  attr_reader :engine

  def initialize(engine)
    @engine = engine
  end

  def load_data
    @merchants ||= create_merchants
  end

  def contents
    CSV.open "./fixtures/merchants.csv", headers: true, header_converters: :symbol
  end

  def create_merchants
    puts "READING MERCHANTS"
    contents.map do |attributes|
      Merchant.new(attributes, self)
    end
  end

  def find_all_items_by_merchant_id(merchant_id)
    engine.item_repo.find_all_by_merchant_id(merchant_id)
  end

  def find_all_invoices_by_merchant_id(merchant_id)
    engine.invoice_repo.find_all_by_merchant_id(merchant_id)
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_id(id)
    merchants.find { |merchant| merchant.id == id }
  end

  def find_all_by_id(id)
    merchants.select { |merchant| merchant.id == id }
  end

  def find_by_name(name)
    merchants.find { |merchant| merchant.name == name }
  end

  def find_all_by_name(name)
    merchants.select { |merchant| merchant.name == name }
  end

  def find_by_created_at(created_at)
    merchants.find { |merchant| merchant.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    merchants.select { |merchant| merchant.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    merchants.find { |merchant| merchant.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    merchants.select { |merchant| merchant.updated_at == updated_at }
  end
end
