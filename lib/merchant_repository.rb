require 'csv'
require_relative 'merchant'

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

  def find_favorite_customer_by_merchant_id(merchant_id)
    engine.merchant_fave_customer(merchant_id)
  end

  def find_all_items_by_merchant_id(merchant_id)
    engine.item_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_all_invoices_by_merchant_id(merchant_id)
    engine.invoice_repository.find_all_by_merchant_id(merchant_id)
  end

  def calculate_total_revenue_by_merchant_id(merchant_id)
    engine.merchant_revenue(merchant_id)
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_id(id)
    merchants.detect { |merchant| merchant.id == id }
  end

  def find_all_by_id(id)
    merchants.select { |merchant| merchant.id == id }
  end

  def find_by_name(name)
    merchants.detect { |merchant| merchant.name.downcase == name.downcase }
  end

  def find_all_by_name(name)
    merchants.select { |merchant| merchant.name.downcase == name.downcase }
  end

  def find_by_created_at(created_at)
    merchants.detect { |merchant| merchant.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    merchants.select { |merchant| merchant.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    merchants.detect { |merchant| merchant.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    merchants.select { |merchant| merchant.updated_at == updated_at }
  end
end
