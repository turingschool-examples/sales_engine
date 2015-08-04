require 'csv'
require_relative 'merchant'
require_relative 'sales_engine'

class MerchantRepository
  attr_accessor :merchants

  def initialize
    @merchants = create_merchants
  end

  def contents
    CSV.open "./fixtures/merchants.csv", headers: true, header_converters: :symbol
  end

  def create_merchants
    contents.map do |row|
      merchant            = Merchant.new
      merchant.id         = row[:id]
      merchant.name       = row[:name]
      merchant.created_at = row[:created_at]
      merchant.updated_at = row[:updated_at]
      merchant
    end
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
