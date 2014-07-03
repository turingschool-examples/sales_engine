gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'
require 'pry'

class EngineTest < Minitest::Test

  attr_reader :engine

  def setup
    @engine = Engine.new(true)
    @invoice                         = InvoiceEntry.new(id: '1', merchant_id: '1')
    @invoice2                        = InvoiceEntry.new(merchant_id: '1')
    @invoice3                        = InvoiceEntry.new(merchant_id: '2')
    @invoice_items1                  = InvoiceItemsEntry.new(invoice_id: '1')
    @invoice_items2                  = InvoiceItemsEntry.new(invoice_id: '2')
    @transaction                     = TransactionEntry.new(invoice_id: '1')
    @transaction3                    = TransactionEntry.new(invoice_id: '2')
    @merchant                        = MerchantEntry.new(id: '1', name: "hello")
    @item                            = ItemEntry.new(merchant_id: '1')
    @item2                           = ItemEntry.new(merchant_id:'2')
    @item3                           = ItemEntry.new(merchant_id: '1')
    @customer1                       = CustomerEntry.new(invoice_id: '1')
    @customer2                       = CustomerEntry.new(invoice_id: '2')
    @engine.invoice_repository       = InvoicesRepository.new([@invoice, @invoice2, @invoice3])
    @engine.invoice_items_repository = InvoiceItemsRepository.new([@invoice_items1, @invoice_items2])
    @engine.transaction_repository   = TransactionRepository.new([@transaction, @transaction3])
    @engine.merchant_repository      = MerchantRepository.new([@merchant])
    @engine.item_repository          = ItemsRepository.new([@item, @item2, @item3])
    @engine.customer_repository      = CustomerRepository.new([@customer1, @customer2])
    @engine.startup
  end

  def test_merchant_invoice_relationship
    merchant                   = engine.merchant_repository.find_by_id('1')
    assert merchant.invoices  == [@invoice, @invoice2]
  end

  def test_merchant_item_relationship
    merchant                   = engine.merchant_repository.find_by_id('1')
    assert merchant.items     == [@item, @item3]
  end

  def test_invoice_relationships
    invoice                        = engine.invoice_repository.find_by_id('1')
    assert invoice.transaction    == [@transaction]
  end

  def test_invoice_invoice_items_relationships
    invoice                        = engine.invoice_repository.find_by_id('1')
    assert invoice.invoice_items  == [@invoice_items1]
  end

  def test_invoice_customer_relationships
    invoice                  = engine.invoice_repository.find_by_id('1')
    assert invoice.customer == @customer1
  end



  # def test_invoice_items_relationships
  #   invoice                       = InvoiceEntry.new(id:'1')
  #   item1                         = ItemEntry.new(invoice_id: '1')
  #   item2                         = ItemEntry.new(invoice_id: '2')
  #   engine.invoice_repository     = InvoicesRepository.new([invoice])
  #   engine.item_repository        = ItemsRepository.new([item1, item2])
  #   engine.startup
  #
  #   invoice                       = engine.invoice_repository.find_by_id('1')
  #   assert invoice.items         == item1
  # end



end
