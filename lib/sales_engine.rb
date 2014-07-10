require_relative 'sales_engine_helper'

class SalesEngine < Relationships

  attr_reader   :csv_dir

  attr_accessor :merchant_repository,
                :invoice_repository,
                :item_repository,
                :transaction_repository,
                :invoice_item_repository,
                :customer_repository


  def initialize(csv_dir, test_mode = false)
    @test_mode = test_mode
    @csv_dir = csv_dir
  end

  def startup
    @test_mode ? the_test_mode_repositories : real_life_repositories
    relation
  end

  def the_test_mode_repositories
    @merchant_repository     ||=
      MerchantRepository.load('test/fixtures/small_merchants.csv')
    @invoice_repository      ||=
      InvoiceRepository.load('test/fixtures/small_invoices.csv')
    @item_repository         ||=
      ItemRepository.load('test/fixtures/small_items.csv')
    @invoice_item_repository ||=
      InvoiceItemRepository.load('test/fixtures/small_invoice_items.csv')
    @customer_repository     ||=
      CustomerRepository.load('test/fixtures/small_customers.csv')
    @transaction_repository  ||=
      TransactionRepository.load('test/fixtures/small_transaction.csv')
  end

  def real_life_repositories
    @merchant_repository     ||=
      MerchantRepository.load(csv_dir + '/merchants.csv')
    @invoice_repository      ||=
      InvoiceRepository.load(csv_dir+'/invoices.csv')
    @item_repository         ||=
      ItemRepository.load(csv_dir+'/items.csv')
    @invoice_item_repository ||=
      InvoiceItemRepository.load(csv_dir+'/invoice_items.csv')
    @customer_repository     ||=
      CustomerRepository.load(csv_dir+'/customers.csv')
    @transaction_repository  ||=
      TransactionRepository.load(csv_dir+'/transactions.csv')
  end

end
