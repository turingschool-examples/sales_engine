require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'invoice_item_repository'
require_relative 'transaction_repository'
require_relative 'customer_repository'
require_relative 'invoice_repository'

class SalesEngine
  def initialize
    startup
  end

  def startup
    merchant_repo
    item_repo
    invoice_repo
    transaction_repo
  end

  def merchant_repo
    MerchantRepository.new
  end

  def item_repo
    ItemRepository.new
  end

  def invoice_repo
    InvoiceRepository.new
  end

  def transaction_repo
    TransactionRepository.new
  end
end


#want to know all items associated with that merchant
#compare item(object).merchant_id to merchant(object).id
