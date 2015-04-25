require 'csv'
require_relative 'merchant'
require_relative 'sales_engine'
require_relative 'load_data'

class MerchantRepository
  attr_accessor :merchants
  attr_reader :engine, :data

  def initialize(data, engine)
    @engine = engine
    @data = data
    @merchants = create_merchants
  end

  def create_merchants
    data.map do |attributes|
      Merchant.new(attributes, self)
    end
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

  def find_all_items_by_merchant_id(merchant_id)
    engine.item_repo.find_all_by_merchant_id(merchant_id)
  end

  def find_all_invoices_by_merchant_id(merchant_id)
    engine.invoice_repo.find_all_by_merchant_id(merchant_id)
  end

  def calculate_total_revenue_by_merchant_id
    engine.merchant_revenue
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
