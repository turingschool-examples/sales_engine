require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'invoice_item_repository'
require_relative 'transaction_repository'
require_relative 'customer_repository'
require_relative 'invoice_repository'
require_relative 'load_data'

class SalesEngine
  include LoadData

  def initialize
    startup
  end

  def startup
    merchant_repo
    item_repo
    invoice_repo
    transaction_repo
    invoice_item_repo
    customer_repo
  end

  def merchant_repo
    @merchant_repository ||= MerchantRepository.new(merchant_data, self)
  end

  def item_repo
    @item_repository ||= ItemRepository.new(item_data, self)
  end

  def invoice_repo
    @invoice_repository ||= InvoiceRepository.new(invoice_data, self)
  end

  def transaction_repo
    @transaction_repository ||= TransactionRepository.new(transaction_data, self)
  end

  def invoice_item_repo
    @invoice_item_repository ||= InvoiceItemRepository.new(invoice_item_data, self)
  end

  def customer_repo
    @customer_repository ||= CustomerRepository.new(customer_data, self)
  end
end

