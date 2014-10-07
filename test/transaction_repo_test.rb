require_relative 'test_helper'
require './lib/transaction_repository'

class TransactionRepoTest < Minitest::Test

def test_repo_gets_populated
  raw_csv = CSVParser.new.load_csv('./data/transactions_test.csv')
  trans_repo = TransactionRepository.new
  trans_repo.populate_repository(raw_csv, Transaction)
  assert_instance_of Transaction, trans_repo.repo[0], "not instance of Transaction"
  assert_instance_of Transaction, trans_repo.repo[-1], "not instance of Transaction"
end

end
