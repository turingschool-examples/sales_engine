class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  def initialize
    @id =           ""
    @name =         ""
    @description =  ""
    @unit_price =   ""
    @merchant_id =  ""
    @created_at =   ""
    @updated_at =   ""

  def invoice_items
  end

  def merchant
  end

  def best_day
  end

end
