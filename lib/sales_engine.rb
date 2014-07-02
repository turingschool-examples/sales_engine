require_relative 'merchant_repository'
require_relative 'invoice_repository'
require_relative 'item_repository'
require_relative 'invoice_items_repository'
require_relative 'customer_repository'
require_relative 'transaction_repository'

class Engine

  def startup
  end

  def merchant_repository
    merchant_repository ||= MerchantRepository.load
  end

  def invoice_repository
    invoice_repository ||= InvoiceRepository.load
  end

  def item_repository
    item_repository ||= ItemRepository.load
  end

  def invoice_items_repository
    invoice_items_repository ||= InvoiceItemRepository.load
  end

  def customer_repository
    customer_repository ||= CustomerRepository.load
  end

  def transaction_repository
    transaction_repository ||= TransactionRepository.load
  end

end
