class ItemRepository
  attr_reader :items, :sales_engine

  def initialize(items, sales_engine)
    @items   = items
    @results = sales_engine
  end

  def find_by(attribute, value)
    items.find {|items| items.send(attribute.to_sym) == value}
  end

  def find_all_by(attribute, value)
    items.find_all {|items| items.send(attribute.to_sym) == value}
  end

  def find_by_id(value); find_by(:id, value) end
  def find_by_name(value); find_by(:name, value.downcase) end
  def find_by_description(value); find_by(:description, value.downcase) end
  def find_by_unit_price(value); find_by(:unit_price, value.downcase) end
  def find_by_merchant_id(value); find_by(:merchant_id, value.downcase) end
  def find_by_created_at(value); find_by(:created_at, value) end
  def find_by_updated_at(value); find_by(:updated_at, value) end

  def find_all_by_id(value); find_all_by(:id, value) end
  def find_all_by_name(value); find_all_by(:name, value.downcase) end
  def find_all_by_description(value); find_all_by(:description, value.downcase) end
  def find_all_by_unit_price(value); find_all_by(:unit_price, value.downcase) end
  def find_all_by_merchant_id(value); find_all_by(:merchant_id, value.downcase) end
  def find_all_by_created_at(value); find_all_by(:created_at, value) end
  def find_all_by_updated_at(value); find_all_by(:updated_at, value) end

  def all
    items
  end

  def random
    items.sample
  end
end
