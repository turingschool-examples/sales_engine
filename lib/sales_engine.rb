require_relative 'csv_parser'
require_relative 'customer_repository'
require_relative 'invoice_item_repository'
require_relative 'invoice_repository'
require_relative 'item_repository'
require_relative 'merchant_repository'
require_relative 'transaction_repository'

class SalesEngine

  def initialize
    @parser = CSVParser.new
    @customer_repository = CustomerRepository.new(self)
    @invoice_item_repository = InvoiceItemRepository.new(self)
    @invoice_repository = InvoiceRepository.new(self)
    @item_repository = ItemRepository.new(self)
    @merchant_repository = MerchantRepository.new(self)
    @transaction_repository = TransactionRepository.new(self)
  end

  def distribute
  end
end
