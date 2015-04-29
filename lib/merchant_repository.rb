require_relative 'merchant'
require 'csv'

class MerchantRepository
  attr_reader :merchants,
              :engine,
              :data

  def initialize(data, engine)
    @engine     = engine
    @data       = data
    @merchants  = create_merchants
  end

  def create_merchants
    data.map do |attributes|
      Merchant.new(attributes, self)
    end
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

  def successful_invoices
    engine.successful_invoices
  end

  def successful_invoice_items
    engine.successful_invoice_items
  end

  def most_revenue(number)
    merchants.max_by(number) { |merchant| merchant.revenue }
  end

  def revenue(date)
    merchants.reduce(0) do |sum, merchant|
      sum + merchant.revenue(date)
    end
  end

  def most_items(number)
    merchants.max_by(number) { |merchant| merchant.total_items_sold }
  end

  def find_all_items_by_merchant_id(merchant_id)
    engine.item_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_all_invoices_by_merchant_id(merchant_id)
    engine.find_invoices_by_merchant_id(merchant_id)
  end

  def find_customers_with_pending_invoices(invoice)
    engine.customers_with_pending_invoices(invoice)
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
