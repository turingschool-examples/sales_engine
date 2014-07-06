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
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @amount     = 0
    @invoices   = data[:invoices]
  end

  def revenue(date = nil)
    @invoices.each do |invoice|
      case date
      when invoice.updated_at then @amount += invoice.revenue
      when nil                then @amount += invoice.revenue
      end
    end
    BigDecimal.new(@amount.to_s)
  end


end
