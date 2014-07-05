class ItemEntry

  attr_reader :id,
              :name,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  attr_accessor :invoice_items,
                :merchant

  def initialize(data)
    @id          = data[:id]
    @name        = data[:name]
    @unit_price  = data[:unit_price]
    @merchant_id = data[:merchant_id]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
  end
end
