require_relative 'merchant_repository'
require_relative 'invoices_repository'
require_relative 'items_repository'
require_relative 'invoice_items_repository'
require_relative 'customer_repository'
require_relative 'transaction_repository'
require 'pry'

class SalesEngine

  attr_accessor :merchant_repository,
                :invoice_repository,
                :item_repository,
                :transaction_repository,
                :invoice_items_repository,
                :customer_repository


  def initialize(test_mode = false)
    @test_mode = test_mode
  end

  def startup
    case
    when @test_mode then the_test_mode_repositories
    else real_life_repositories
    end

    merchant_relationship
    invoice_items_relationship
    invoice_relationship
    item_relationship
    transaction_relationship
    customer_relationship
  end

  def the_test_mode_repositories
    @merchant_repository      ||= MerchantRepository.new
    @invoice_repository       ||= InvoicesRepository.new
    @item_repository          ||= ItemsRepository.new
    @invoice_items_repository ||= InvoiceItemsRepository.new
    @customer_repository      ||= CustomerRepository.new
    @transaction_repository   ||= TransactionRepository.new
  end

  def real_life_repositories
    @merchant_repository       = MerchantRepository.new.load('test/fixtures/biggggg_items.csv')
    @invoice_repository        = InvoicesRepository.new.load('test/fixtures/small_items.csv')
    @item_repository           = ItemsRepository.new.load('test/fixtures/small_items.csv')
    @invoice_item_repository   = InvoiceItemsRepository.new.load('test/fixtures/small_items.csv')
    @customer_repository       = CustomerRepository.new.load('test/fixtures/small_items.csv')
    @transaction_repository    = TransactionRepository.new.load('test/fixtures/small_items.csv')
  end

  def merchant_relationship
    @merchant_repository.all.each do |merchant|
      merchant.invoices = invoice_repository.find_all_by_merchant_id(merchant.id)
      merchant.items    = item_repository.find_all_by_merchant_id(merchant.id)
    end
  end

  def invoice_items_relationship
    @invoice_items_repository.all.each do |invoice_item|
      invoice_item.items = item_repository.find_all_by_id(invoice_item.item_id)
    end
  end

  def invoice_items_list(invoice)
    @items = []
    invoice.invoice_items.each do |invoice_item|
      @items += invoice_item.items
    end
    return @items
  end

  def invoice_relationship
    @invoice_repository.all.each do |invoice|
      invoice.transaction   = transaction_repository.find_all_by_invoice_id(invoice.id)
      invoice.invoice_items = invoice_items_repository.find_all_by_invoice_id(invoice.id)
      invoice.customer      = customer_repository.find_by_id(invoice.customer_id)
      # binding.pry
      invoice.items         = invoice_items_list(invoice)
      invoice.merchant      = merchant_repository.find_by_id(invoice.merchant_id)
    end
  end

  def item_relationship
    @item_repository.all.each do |item|
      item.invoice_items = invoice_items_repository.find_all_by_item_id(item.id)
      item.merchant      = merchant_repository.find_by_id(item.merchant_id)
    end
  end

  def transaction_relationship
    @transaction_repository.all.each do |transaction|
      transaction.invoice = invoice_repository.find_by_id(transaction.invoice_id)
    end
  end

  def customer_relationship
    @customer_repository.all.each do |customer|
      customer.invoices = invoice_repository.find_all_by_customer_id(customer.id)
    end
  end
end
