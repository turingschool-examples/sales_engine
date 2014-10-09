require_relative 'helper_test'
require './lib/invoice_repository'
require './lib/sales_engine'

class InvoiceRepositoryTest < Minitest::Test

  def test_repo_gets_populated
    raw_csv = CSVParser.new.load_csv('./data/invoices_test.csv')
    invoice_repository = InvoiceRepository.new(SalesEngine.new)
    invoice_repository.populate_repository(raw_csv, Invoice)
    assert_instance_of Invoice, invoice_repository.repository[0], "not instance of invoice"
    assert_instance_of Invoice, invoice_repository.repository[-1], "not instance of invoice"
  end

end
