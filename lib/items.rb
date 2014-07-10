require 'bigdecimal'
require_relative 'invoice_item'
require_relative 'transaction'
require 'pry'
class Item

  attr_reader :id,
              :name,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  attr_accessor :invoice_items,
                :merchant

  def initialize(data)
    @id            = data[:id].to_i
    @name          = data[:name]
    @unit_price    = price(data[:unit_price])
    @merchant_id   = data[:merchant_id].to_i
    @created_at    = date_parse(data[:created_at])
    @updated_at    = date_parse(data[:updated_at])

    @invoice_items = data[:invoice_items]
  end

  def date_parse(date)
    if date != nil
      Date.parse(date)
    else
      date
    end
  end

  def price(number)
    price = number.to_f / 100
    BigDecimal.new(price.to_s)
  end


  def revenue
    if status?
      invoice_items.reduce(0) do |sum, invoice_item|
        sum + invoice_item.revenue
      end
    end
  end

  def status?
    @invoice_items.any?(&:status?)

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

end
