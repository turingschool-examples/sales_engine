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
    invoice_item_repo
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

  def invoice_item_repo
    InvoiceItemRepository.new
  end
end


