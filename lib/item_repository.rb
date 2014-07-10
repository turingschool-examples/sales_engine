require_relative 'item_repository_helper'

class ItemRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
       objects << Item.new(row)
     end
    new(objects)
  end

  attr_reader :objects

  def most_revenue(number)
    top_revenue = objects.sort_by { |item| -item.revenue.to_i }.first(number)
  end

  def most_items(number)
    items = objects.collect {|item| item if item.status?}
    top_items = items.group_by { |item| item }.values.sort_by(&:size)
    top_items.flatten.compact.uniq[0..(number-1)]
  end

end
