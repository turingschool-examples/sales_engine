require 'pry'
class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at


  attr_accessor :invoices,
                :items

  def initialize(data)
    @id         = data[:id]
    @name       = data[:name]
    @created_at = nil
    @updated_at = nil
    @amount     = 0
    @items      = data[:items]
  end



  def revenue(date = nil)
    @items.each do |item|
      if date != nil
        if item.updated_at == date
          @amount += item.unit_price
        end
      else
        @amount += item.unit_price
      end
    end
    BigDecimal.new(@amount)
  end
end
