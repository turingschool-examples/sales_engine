require_relative 'test_helper'
require './lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

def test_repo_gets_populated
  raw_csv = CSVParser.new.load_csv('./data/invoices_test.csv')
  invoice_repo = InvoiceRepository.new
  invoice_repo.populate_repository(raw_csv, Invoice)
  assert_instance_of Invoice, invoice_repo.repo[0], "not instance of invoice"
  assert_instance_of Invoice, invoice_repo.repo[-1], "not instance of invoice"
end

end
