require_relative 'merchant_repository'
require_relative 'invoice_repository'
require_relative 'item_repository'
require_relative 'invoice_item_repository'
require_relative 'customer_repository'
require_relative 'transaction_repository'
require_relative 'csv_reader'

class SalesEngine
  attr_reader :merchant_repository, :invoice_repository, :item_repository,
    :invoice_item_repository, :customer_repository, :transaction_repository

  def initialize(file_dir = "test")
    @file_dir = file_dir
  end

  def startup(reader = CSVReader.new)
    @merchant_repository = MerchantRepository.new(reader.read("merchants.csv", @file_dir))
    @invoice_repository = InvoiceRepository.new(reader.read("invoices.csv", @file_dir))
    @item_repository = ItemRepository.new(reader.read("items.csv", @file_dir))
    @invoice_item_repository = InvoiceItemRepository.new(reader.read("invoice_items.csv", @file_dir))
    @customer_repository = CustomerRepository.new(reader.read("customers.csv", @file_dir))
    @transaction_repository = TransactionRepository.new(reader.read("transactions.csv", @file_dir))

    make_relationships
  end

  def make_relationships
    merchant_repository.give_items_from(item_repository)
    merchant_repository.give_invoices_from(invoice_repository)

    invoice_item_repository.give_invoices_from(invoice_repository)
    invoice_item_repository.give_items_from(item_repository)

    invoice_repository.give_transactions_from(transaction_repository)
    invoice_repository.give_invoice_items_from(invoice_item_repository)
    invoice_repository.give_customers_from(customer_repository)
    invoice_repository.give_merchants_from(merchant_repository)

    item_repository.give_invoice_items_from(invoice_item_repository)
    item_repository.give_merchants_from(merchant_repository)

    transaction_repository.give_invoices_from(invoice_repository)

    customer_repository.give_invoices_from(invoice_repository)
  end
end
