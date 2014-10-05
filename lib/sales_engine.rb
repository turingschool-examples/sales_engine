require_relative 'item_repository'
require_relative 'merchant_repository'
require_relative 'customer_repository'
require_relative 'invoice_item_repository'
require_relative 'transaction_repository'
require_relative 'invoice_repository'

class SalesEngine
  attr_reader :directory,
              :item_repository,
              :merchant_repository,
              :customer_repository,
              :invoice_item_repository,
              :transaction_repository,
              :invoice_repository

  def initialize(directory)
    @directory = directory
  end

  def start
    @item_repository =         ItemRepository.new(directory,self)
    @merchant_repository =     MerchantRepository.new(directory,self)
    @customer_repository =     CustomerRepository.new(directory,self)
    @invoice_item_repository = InvoiceItemRepository.new(directory,self)
    @transaction_repository =  TransactionRepository.new(directory,self)
    @invoice_repository =      InvoiceRepository.new(directory,self)
  end
end
