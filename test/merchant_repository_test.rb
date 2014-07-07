gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant_repository'
require_relative '../lib/invoice_item'
require_relative '../lib/invoice'

require 'pry'

class MerchantRepositoryTest < Minitest::Test

  def test_find_by_id
    repository = MerchantRepository.new()
    repository.load('test/fixtures/small_merchants.csv')
    entry = repository.find_by_id('16')
    assert_equal "16", entry.id
  end

  def test_find_by_name
    repository = MerchantRepository.new()
    repository.load('test/fixtures/small_merchants.csv')
    entry = repository.find_by_name('Bosco, Howe and Davis')
    assert_equal "Bosco, Howe and Davis", entry.name
  end

  def test_find_all_by_name
    repository = MerchantRepository.new()
    repository.load('test/fixtures/small_merchants.csv')
    entries = repository.find_all_by_name('Bosco, Howe and Davis')
    assert_equal 2, entries.length
    entries.each do |entry|
      assert_equal "Bosco, Howe and Davis", entry.name
    end
  end

  def test_random_merchant
    repository = MerchantRepository.new()
    repository.load('test/fixtures/small_merchants.csv')
    entry = repository.random
    assert entry.respond_to?(:name)
  end

  def setup
    @invoice_item1 = InvoiceItem.new(quantity: '1', unit_price: '33133')
    @invoice_item2 = InvoiceItem.new(quantity: '2', unit_price: '43121')
    @invoice_item3 = InvoiceItem.new(quantity: '3', unit_price: '12314')
    @invoice1 = Invoice.new(invoice_items: [@invoice_item1, @invoice_item3], status: 'shipped', updated_at:'2012-03-25 09:54:09 UTC')
    @invoice2 = Invoice.new(invoice_items: [@invoice_item1, @invoice_item3], status: 'shipped', updated_at:'2012-03-25 09:54:09 UTC')
    @invoice3 = Invoice.new(invoice_items: [@invoice_item2, @invoice_item3], status: 'shipped', updated_at:'2012-03-26 09:54:09 UTC')
    @merchant = Merchant.new(name: 'merchant', invoices: [@invoice1, @invoice2])
    @merchant2 = Merchant.new(name: 'merchant2',invoices: [@invoice2, @invoice3])
    @merchant3 = Merchant.new(name: 'merchant3', invoices: [@invoice3, @invoice1])
    @repository = MerchantRepository.new([@merchant, @merchant2, @merchant3])
  end

  def test_most_revenue
    most = @repository.most_revenue(2)
    assert_equal 'merchant', most.first.name
  end

  def test_revenue_by_date
    assert_equal BigDecimal.new('1401.50'), @repository.revenue(Date.parse('2012-03-25'))
  end
end
