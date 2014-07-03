gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'
require 'pry'

class EngineTest < Minitest::Test
  def test_merchant_relationships
    engine                     = Engine.new(true)
    merchant                   = MerchantEntry.new(id: '1', name: "hello")
    invoice                    = InvoiceEntry.new(merchant_id: '1', customer_id: 1)
    invoice2                   = InvoiceEntry.new(merchant_id: '1', customer_id: 2)
    invoice3                   = InvoiceEntry.new(merchant_id: '2', customer_id: 2)
    item                       = ItemEntry.new(merchant_id: '1')
    item2                      = ItemEntry.new(merchant_id:'2')
    item3                      = ItemEntry.new(merchant_id: '1')
    engine.merchant_repository = MerchantRepository.new([merchant])
    engine.invoice_repository  = InvoicesRepository.new([invoice, invoice2, invoice3])
    engine.item_repository     = ItemsRepository.new([item, item2, item3])
    engine.startup

    merchant                   = engine.merchant_repository.find_by_id('1')
    assert merchant.invoices  == [invoice, invoice2]
    assert merchant.items     == [item, item3]
  end



  def test_invoice_relationships
    engine                        = Engine.new(true)
    invoice                       = InvoiceEntry.new(id: '1')
    transaction                   = TransactionEntry.new(invoice_id:'1')
    transaction3                  = TransactionEntry.new(invoice_id: '2')
    engine.invoice_repository     = InvoicesRepository.new([invoice])
    engine.transaction_repository = TransactionRepository.new([transaction, transaction3])
    engine.startup

    invoice                       = engine.invoice_repository.find_by_id('1')
    assert invoice.transaction   == transaction
  end
end
