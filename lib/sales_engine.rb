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

  def startup
    customer_repository.populate_repository
    invoice_item_repository.populate_repository
    invoice_repository.populate_repository
    item_repository.populate_repository
    merchant_repository.populate_repository
    transaction_repository.populate_repository
  end

  def distribute
  end

  def find_merchant_by_id(merchant_id)
    merchant_repository.find_by_id(merchant_id)
  end

  def find_invoice_items(item_id)
    invoice_item_repository.find_all_by_item_id(item_id)
  end
end
