require_relative 'merchant_repository_helper'

class MerchantRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol ) {|row| objects << Merchant.new(row)}
    new(objects)
  end

  def revenue(date)
    objects.reduce(0) { |sum, object| sum += object.revenue(date) }
  end

  def most_revenue(number)
    objects.sort_by { |merchant| -merchant.revenue.to_i }[0..(number-1)]
  end

  def most_items(number)
    objects.sort_by { |merchant| -merchant.total_items_sold }[0..(number-1)]
  end

end
