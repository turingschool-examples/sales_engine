require_relative 'test_helper'
require 'csv_reader'

class CSVReaderTest < Minitest::Test
  attr_reader :reader, :customers, :invoice_items, :invoices, :items,
              :merchants, :transactions

  def setup
    @reader  = CSVReader.new
    @customers     = reader.read("test_customers.csv")
    @invoice_items = reader.read("test_invoice_items.csv")
    @invoices      = reader.read("test_invoices.csv")
    @items         = reader.read("test_items.csv")
    @merchants     = reader.read("test_merchants.csv")
    @transactions  = reader.read("test_transactions.csv")
  end

  def test_correct_csv_lengths
    assert_equal @customers.size,       50
    assert_equal @invoice_items.size,   50
    assert_equal @invoices.size,        50
    assert_equal @items.size,           50
    assert_equal @merchants.size,       50
    assert_equal @transactions.size,    50
  end

  def test_customers_csv_properly_parses_headers_and_values
    assert_equal "1",                       customers[0].id
    assert_equal "Joey",                    customers[0].first_name
    assert_equal "Ondricka",                customers[0].last_name
    assert_equal "2012-03-27 14:54:09 UTC", customers[0].created_at
    assert_equal "2012-03-27 14:54:09 UTC", customers[0].updated_at
  end

  def test_invoice_items_csv_properly_parses_headers_and_values
    assert_equal "1",                       invoice_items[0].id
    assert_equal "539",                     invoice_items[0].item_id
    assert_equal "1",                       invoice_items[0].invoice_id
    assert_equal "5",                       invoice_items[0].quantity
    assert_equal "13635",                   invoice_items[0].unit_price
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items[0].created_at
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items[0].updated_at
  end

  def test_invoices_csv_properly_parses_headers_and_values
    assert_equal "1",                       invoices[0].id
    assert_equal "1",                       invoices[0].customer_id
    assert_equal "26",                      invoices[0].merchant_id
    assert_equal "shipped",                 invoices[0].status
    assert_equal "2012-03-25 09:54:09 UTC", invoices[0].created_at
    assert_equal "2012-03-25 09:54:09 UTC", invoices[0].updated_at
  end

  def test_items_csv_properly_parses_headers_and_values
    assert_equal "1",                       items[0].id
    assert_equal "Item Qui Esse",           items[0].name
    assert_equal "75107",                   items[0].unit_price
    assert_equal "1",                       items[0].merchant_id
    assert_equal "2012-03-27 14:53:59 UTC", items[0].created_at
    assert_equal "2012-03-27 14:53:59 UTC", items[0].updated_at

    assert_includes items[0].description, "Nihil autem sit"
  end

  def test_merchants_csv_properly_parses_headers_and_values
    assert_equal "1",                       merchants[0].id
    assert_equal "Schroeder-Jerde",         merchants[0].name
    assert_equal "2012-03-27 14:53:59 UTC", merchants[0].created_at
    assert_equal "2012-03-27 14:53:59 UTC", merchants[0].updated_at
  end

  def test_transactions_csv_properly_parses_headers_and_values
    assert_equal "1",                       transactions[0].id
    assert_equal "1",                       transactions[0].invoice_id
    assert_equal "4654405418249632",        transactions[0].credit_card_number
    assert_equal  nil,                      transactions[0].credit_card_expiration_date
    assert_equal "success",                 transactions[0].result
    assert_equal "2012-03-27 14:54:09 UTC", transactions[0].created_at
    assert_equal "2012-03-27 14:54:09 UTC", transactions[0].updated_at
  end

  def test_reader_successfully_converts_to_corresponding_classes
    assert_equal [Customer],    @customers.collect(&:class).uniq
    assert_equal [InvoiceItem], @invoice_items.collect(&:class).uniq
    assert_equal [Invoice],     @invoices.collect(&:class).uniq
    assert_equal [Item],        @items.collect(&:class).uniq
    assert_equal [Merchant],    @merchants.collect(&:class).uniq
    assert_equal [Transaction], @transactions.collect(&:class).uniq
  end

end
