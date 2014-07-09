require          'csv'
require_relative 'items'
require_relative 'repository'
require_relative 'transaction'
# require 'pry'

class ItemRepository < Repository


  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      objects << Item.new(row)
    end
    new(objects)
  end

  attr_reader :objects
    #most_revenue(x) returns the top x item instances ranked by total revenue generated
  def most_revenue(number)
    top_revenue = objects.sort_by { |item| -item.revenue }
    top_revenue[0..number-1]
  end

  def paid_transactions
    successuful_transactions = tranactions.select { |invoice| transactions.status == 'success' }
    successuful_transactions.map(&:invoice_id).flatten
  end


  #most_items(x) returns the top x item instances ranked by total number sold

end
