require_relative 'items_helper'

class Item

  attr_reader   :id,
                :name,
                :unit_price,
                :merchant_id,
                :created_at,
                :updated_at

  attr_accessor :invoice_items,
                :merchant,
                :invoice

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
    date != nil ? Date.parse(date) : date
  end

  def price(number)
    BigDecimal.new((number.to_f / 100).to_s)
  end

  def revenue
    if status?
      invoice_items.reduce(0) { |sum, invoice_item| sum + invoice_item.revenue }
    end
  end

  def invoice
    invoice_items.map {|invoice_item| invoice_item.invoice}
  end

  def best_day
    sorted_invoice = invoice.sort_by {|invoice| invoice.revenue(invoice.updated_at).to_f if invoice.status?}
    sorted_invoice.last.updated_at
  end

  def status?
    @invoice_items.any?(&:status?)
  end

end
