# require 'pry'
class Merchant

  attr_reader   :id,
                :name,
                :created_at,
                :updated_at

  attr_accessor :invoices,
                :items

  def initialize(data)
    @id         = data[:id].to_i
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @invoices   = data[:invoices]
  end

  def revenue(date = nil)
    amount = BigDecimal.new("0")
    @invoices.each {|invoice| amount += invoice.revenue if (date == nil || date == invoice.updated_at) && invoice.revenue != nil }
    amount
  end

  def total_items_sold
    successful_invoice_items.reduce(0) { |sum, invoice_item| sum += invoice_item.quantity.to_i }
  end

  def favorite_customer
    customers = invoices.collect { |invoice| invoice.customer if invoice.status? }.compact
    customers.group_by { |item| item }.values.max_by(&:size).first
  end

  def customers_with_pending_invoices
    invoices.collect{ |invoice| invoice.customer if invoice.none?}.compact
  end

  private

  def successful_invoice_items
    successful_invoices = invoices.select { |invoice| invoice.status? }
    successful_invoices.map(&:invoice_items).flatten
  end


end
