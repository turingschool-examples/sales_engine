require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'invoice_repository'
require_relative 'invoice_item_repository'
require_relative 'customer_repository'
require_relative 'transaction_repository'

class SalesEngine
  attr_reader :merchant_repository,
              :invoice_repository,
              :item_repository,
              :invoice_item_repository,
              :customer_repository,
              :transaction_repository

  def startup
    @merchant_repository     = MerchantRepository.new(merchants.csv)
    @invoice_repository      = InvoiceRepository.new(invoices.csv)
    @item_repository         = ItemRepository.new(items.csv)
    @invoice_item_repository = InvoiceItemRepository.new(invoice_items.csv)
    @customer_repository     = CustomerRepository.new(customers.csv)
    @transaction_repository  = TransactionRepository.new(transactions.csv)
  end

end
