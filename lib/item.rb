class Item
<<<<<<< HEAD
  attr_reader :id, :description, :name, :unit_price, :merchant_id, :created_at, :updated_at
=======
  attr_reader :id, :description, :name, :created_at, :updated_at, :unit_price, :merchant_id
>>>>>>> 1ff623cf9c30d780a01850acff557736ed5f44a5

  def initialize(data)
    @id                 = data[:id]
    @description        = data[:description]
    @name               = data[:name]
    @unit_price         = data[:unit_price]
    @merchant_id        = data[:merchant_id]
    @created_at         = data[:created_at]
    @updated_at         = data[:updated_at]
  end

  def invoice_items
  end

  def merchant
  end
end
