require_relative 'csv_parser'

class SalesEngine

  def initialize
    @parser = CSVParser.new
  end

  @customer_repository = CustomerRepository.new()
  @invoice_item_repository = InvoiceItemRepository.new()
  @invoice_repository = InvoiceRepository.new()
  @item_repository = ItemRepository.new()
  @merchant_repository = MerchantRepository.new()
  @transaction_repository = TransactionRepository.new()

  def distribute
end
