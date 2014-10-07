require_relative 'test_helper'
require_relative '../lib/invoice_repository'
require_relative '../lib/invoice'

class InvoiceRepositoryTest < Minitest::Test
  def setup
    invoice_one = Invoice.new {id: "1" customer_id: "16" merchant_id: "41" status: "pass" created_at: "month" updated_at: "190" }
    invoice_two = Invoice.new {id: "3" customer_id: "10" merchant_id: "23" status: "fail" created_at: "week" updated_at: "190" }
    invoice_three = Invoice.new {id: "2" customer_id: "8" merchant_id: "9" status: "fail" created_at: "week" updated_at: "hhh" }
    @invoices = [invoice_one, invoice_two, invoice_three]
    @repository = InvoiceRepository.new(@invoices)
  end

  def test_returns_all
    assert_equal @invoices, @repository.all
  end

  def test_returns_random
    assert_instance_of Invoice, @repository.random
  end

  def test_finds_by_id
  	assert_equal @invoices[2], @repository.find_by_id("2")
  end

  def test_finds_by_customer_id
  	assert_equal @invoices[1], @repository.find_by_customer_id("10")
  end

  def test_finds_by_merchant_id
  	assert_equal @invoices[0], @repository.find_by_merchant_id("41")
  end

  def test_finds_by_status
  	assert_equal @invoices[0], @repository.find_by_status("pass")
  end

  def test_finds_by_created_at
  	assert_equal @invoices[0], @repository.find_by_created_at("month")
  end

  def test_finds_by_updated_at
  	assert_equal @invoices[2], @repository.find_by_updated_at("hhh")
  end

  def test_finds_all_by_id
  	assert_equal 1, @repository.find_all_by_id("1").size
  end

  def test_finds_all_by_customer_id
  	assert_equal 1, @repository.find_all_by_customer_id("16").size
  end

  def test_finds_all_by_merchant_id
  	assert_equal 1, @repository.find_all_by_merchant_id("41").size
  end

  def test_finds_all_by_status
  	assert_equal 2, @repository.find_all_by_status("fail").size
  end

  def test_finds_all_by_created_at
  	assert_equal 2, @repository.find_all_by_created_at("week").size
  end

  def test_finds_all_by_updated_at
  	assert_equal 2, @repository.find_all_by_updated_at("190").size
  end
end
