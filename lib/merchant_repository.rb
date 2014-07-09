require          'csv'
require_relative 'merchant'
require_relative 'items'
require_relative 'repository'

class MerchantRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @objects << Merchant.new(row)
    end
  end

  attr_reader :objects

  def revenue(date)
    objects.reduce(0) do |sum, object|
      sum += object.revenue(date)
    end
  end

  def most_revenue(number)
    top_revenue = objects.sort_by { |merchant| merchant.revenue }
    top_revenue[0..number]
  end

  def most_items(number)
    objects.sort_by { |merchant| -merchant.total_items_sold }[0..(number-1)]
  end

end
