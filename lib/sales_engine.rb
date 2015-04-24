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
    merchant_repo.load_data
    item_repo.load_data
    invoice_repo.load_data
    transaction_repo.load_data
    invoice_item_repo.load_data
    customer_repo.load_data
  end

  def merchant_repo
    @merchant_repository ||= MerchantRepository.new(self)
  end

  def item_repo
    @item_repository ||= ItemRepository.new(self)
  end

  def invoice_repo
    @invoice_repository ||= InvoiceRepository.new(self)
  end

  def transaction_repo
    @transaction_repository ||= TransactionRepository.new(self)
  end

  def invoice_item_repo
    @invoice_item_repository ||= InvoiceItemRepository.new(self)
  end

  def customer_repo
    @customer_repository ||= CustomerRepository.new(self)
  end
end


