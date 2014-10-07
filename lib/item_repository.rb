class ItemRepository
  attr_reader :items
  def initialize(items = [])
    @items = items
  end

  def all
    items
  end

  def random
    items.sample
  end

  [:id, :name, :description, :price, :merchant_id, :created_at, :updated_at].each do |attribute|
    define_method("find_by_#{attribute}".to_sym) do |attribute_value|
      items.select { |item| item.send(attribute.to_sym) == attribute_value.downcase }.first
    end
  end

  [:id, :name, :description, :price, :merchant_id, :created_at, :updated_at].each do |attribute|
    define_method("find_all_by_#{attribute}".to_sym) do |attribute_value|
      items.select { |item| item.send(attribute.to_sym) == attribute_value.downcase }
    end
  end
end