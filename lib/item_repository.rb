require_relative 'item_repository_helper'

class ItemRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) { |row| objects << Item.new(row) }
    new(objects)
  end

  attr_reader :objects


  def most_revenue(number)
    top_revenue = objects.sort_by { |item| item.revenue }.reverse.first(number)
  end


    #if item.status?
      #objects.invoice_item.sort_by { |item| -item.revenue }[0..number-1]
    #end


  def paid_transactions
    transactions.select { |invoice| transactions.status == 'success' }.map(&:invoice_id).flatten
  end


  #most_items(x) returns the top x item instances ranked by total number sold

end
