require 'bigdecimal'
require 'bigdecimal/util'
require 'time'

class InvoiceItem
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at,
              :repo

  def initialize(data, repo)
    @id =          data[:id].to_i
    @item_id =     data[:item_id].to_i
    @invoice_id =  data[:invoice_id].to_i
    @quantity =    data[:quantity].to_d
    @unit_price =  data[:unit_price].to_d
    @created_at =  Time.parse(data[:created_at])
    @updated_at =  Time.parse(data[:updated_at])
    @repo =        repo
  end

  def invoice
  end

  def item
  end
end
