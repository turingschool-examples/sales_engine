require 'bigdecimal'
require 'bigdecimal/util'
require 'time'

class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :repo

  def initialize(data, repo)
    @id =          data[:id].to_i
    @name =        data[:name]
    @description = data[:description]
    @unit_price =  data[:unit_price].to_d
    @merchant_id = data[:merchant_id].to_i
    @created_at =  Time.parse(data[:created_at])
    @updated_at =  Time.parse(data[:updated_at])
    @repo =        repo
  end

  def invoice_items
  end

  def merchant
  end
end
