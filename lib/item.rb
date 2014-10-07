class Item
  attr_reader :id,
              :name,
              :description,
              :price,
              :merchant_id,
              :created_at,
              :updated_at

  def initialize(data)
    @id          = data[:id]
    @name        = data[:name].downcase
    @description = data[:description].downcase
    @price       = data[:price]
    @merchant_id = data[:merchant_id]
    @created_at  = data[:created_at].downcase
    @updated_at  = data[:updated_at].downcase
  end
end