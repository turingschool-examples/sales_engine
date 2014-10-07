class Item
  attr_accessor :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  def initialize
    @id = ""
    @name
    @description
    @unit_price
    @merchant_id
    @created_at
    @updated_at
  end

  def invoice_items
  end

  def merchant
  end

  def best_day
  end

end
