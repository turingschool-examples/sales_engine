require './lib/merchant_repository'

class Merchant
  attr_accessor :id, :name, :created_at, :updated_at

  def initialize
    @id
    @name
    @created_at
    @updated_at
  end

  def items
    engine = SalesEngine.new
    engine.item_repo.find_all_by_merchant_id(@id)
  end

  def invoices
    engine = SalesEngine.new
    engine.invoice_repo.find_all_by_merchant_id(@id)
  end
end


