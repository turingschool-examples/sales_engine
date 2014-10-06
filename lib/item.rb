class Item
  attr_reader :id,
              :name,
              :description,
              :price,
              :merchant_id,
              :created_at,
              :updated_at

  def initialize(data)
    @id          = data[:id].to_i
    @name        = data[:name].downcase
    @description = data[:description].downcase
    @price       = data[:price].to_i
    @merchant_id = data[:merchant_id].to_i
    @created_at  = Time.parse(data[:created_at])
    @updated_at  = Time.parse(data[:updated_at])
  end

  def find_by_id(id)
  end
end