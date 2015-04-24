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

    @merchant_repository ||= begin
      data = load_data("merchants", "data")
      MerchantRepository.new(data, self)
    end
  end

  def item_repo

    @item_repository ||= begin
    data = load_data("items", "data")
    ItemRepository.new(data, self)
    end
  end

  def invoice_repo

    @invoice_repository ||= begin
      data = load_data("invoices", "data")
      InvoiceRepository.new(data, self)
    end
  end

  def transaction_repo
    @transaction_repository ||= begin
    data = load_data("transactions", "data")
    TransactionRepository.new(data, self)
    end
  end

  def invoice_item_repo
    @invoice_item_repository ||= begin
      data = load_data("invoice_items", "data")
      InvoiceItemRepository.new(data, self)
    end
  end

  def customer_repo
    @customer_repository ||= begin
    data = load_data("customers", "data")
    CustomerRepository.new(data, self)
  end
end
end

