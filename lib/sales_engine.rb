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

  def initialize(file_dir = "data", reader = CSVReader.new)
    @merchant_data             = reader.read("merchants.csv", file_dir)
    @invoice_data              = reader.read("invoices.csv", file_dir)
    @item_data                 = reader.read("items.csv", file_dir)
    @invoice_item_data         = reader.read("invoice_items.csv", file_dir)
    @customer_data             = reader.read("customers.csv", file_dir)
    @transaction_data          = reader.read("transactions.csv", file_dir)
  end

  def startup
    initialize_repos
    initialize_dependencies
    make_relationships
  end

  def initialize_repos
    @merchant_repository     = MerchantRepository.new(@merchant_data)
    @invoice_repository      = InvoiceRepository.new(@invoice_data)
    @item_repository         = ItemRepository.new(@item_data)
    @invoice_item_repository = InvoiceItemRepository.new(@invoice_item_data)
    @customer_repository     = CustomerRepository.new(@customer_data)
    @transaction_repository  = TransactionRepository.new(@transaction_data)
  end

  def initialize_dependencies
    @merchant_dependencies     = [item_repository, invoice_repository]
    @invoice_item_dependencies = [invoice_repository, item_repository]
    @item_dependencies         = [invoice_item_repository, merchant_repository]
    @transaction_dependency    = [invoice_repository]
    @customer_dependency       = [invoice_repository]
    @invoice_dependencies      = [
                                  transaction_repository,
                                  invoice_item_repository,
                                  customer_repository,
                                  merchant_repository
                                ]
  end

  def make_relationships
    merchant_repository.set_relations(@merchant_dependencies)
    invoice_item_repository.set_relations(@invoice_item_dependencies)
    invoice_repository.set_relations(@invoice_dependencies)
    item_repository.set_relations(@item_dependencies)
    transaction_repository.set_relations(@transaction_dependency)
    customer_repository.set_relations(@customer_dependency)
  end
end
