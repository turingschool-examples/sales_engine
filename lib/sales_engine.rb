require_relative 'csv_parser'
require_relative 'customer_repository'
require_relative 'invoice_item_repository'
require_relative 'invoice_repository'
require_relative 'item_repository'
require_relative 'merchant_repository'
require_relative 'transaction_repository'
require 'bigdecimal'

class SalesEngine

  attr_reader :parser,
              :customer_repository,
              :invoice_item_repository,
              :invoice_repository,
              :item_repository,
              :merchant_repository,
              :transaction_repository,
              :filepath

def initialize(filepath = "#{File.join(File.expand_path('../..',  __FILE__))}/data")
    @filepath                 = filepath
    @customer_repository      = CustomerRepository.new(self, filepath)
    @invoice_item_repository  = InvoiceItemRepository.new(self, filepath)
    @invoice_repository       = InvoiceRepository.new(self, filepath)
    @item_repository          = ItemRepository.new(self, filepath)
    @merchant_repository      = MerchantRepository.new(self, filepath)
    @transaction_repository   = TransactionRepository.new(self, filepath)
  end

  def parsed_csv(path)
    parser.load_csv(path)
  end

  def repository_array
    [customer_repository, invoice_item_repository, invoice_repository,
    item_repository, merchant_repository, transaction_repository]
  end

  def startup
    repository_array.map { |repo| repo.make_repo }
  end

  def distribute
  end

  def find_items_by_id(id)
    item_repository.find_all_by_merchant_id(id)
  end

  def find_invoices_by_merchant_id(merchant_id)
    invoice_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_invoices_by_customer_id(customer_id)
    invoice_repository.find_all_by_customer_id(customer_id)
  end

  def find_transaction_by_id(transaction_id)
    transaction_repository.find_all_by_invoice_id(transaction_id)
  end

  def find_invoice_items(invoice_id)
    invoice_item_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_invoice_by_invoice_id(invoice_id)
    invoice_repository.find_by_id(invoice_id)
  end

  def find_item_by_id(item_id)
    item_repository.find_by_id(item_id)
  end

  def find_merchant_by_id(merchant_id)
    merchant_repository.find_by_id(merchant_id)
  end

  def find_invoice_items(invoice_id)
    invoice_item_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_invoice_items_by_item_id(item_id)
    invoice_item_repository.find_all_by_item_id(item_id)
  end

  def find_customer_by_id(customer_id)
    customer_repository.find_by_id(customer_id)
  end

  def find_invoice_by_id(invoice_id)
    invoice_repository.find_by_id(invoice_id)
  end
end

# engine = SalesEngine.new
# engine.startup
# invoice = engine.invoice_repository.find_by_id(1002)
# puts invoice.items.size
