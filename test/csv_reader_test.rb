require_relative 'test_helper'
require 'csv_reader'

class CSVReaderTest < Minitest::Test
  attr_reader :reader, :customers, :invoice_items, :invoices, :items,
              :merchants, :transactions

  def setup
    skip
    @reader  = CSVReader.new
    binding.pry
    first_50 = 0..50
    @customers     = reader.read("customers.csv")[first_50]
    @invoice_items = reader.read("invoice_items.csv")[first_50]
    @invoices      = reader.read("invoices.csv")[first_50]
    @items         = reader.read("items.csv")[first_50]
    @merchants     = reader.read("merchants.csv")[first_50]
    @transcations  = reader.read("transactions.csv")[first_50]
  end

  def test_customers_csv_properly_parses_headers_and_values
    assert_equal 1,                         customers[0].fetch("id")
    assert_equal "Joey",                    customers[0].fetch("first_name")
    assert_equal "Ondricka",                customers[0].fetch("last_name")
    assert_equal "2012-03-27 14:54:09 UTC", customers[0].fetch("created_at")
    assert_equal "2012-03-27 14:54:09 UTC", customers[0].fetch("updated_at")
  end

end
