require 'transaction_repository'

describe TransactionRepository do
  before(:each) do
    @repo = TransactionRepository
  end

  it "loads csv data" do
    expect(@repo.collection).not_to be_empty
  end

  it 'finds all items in a repository' do
    expect(@repo.all.count).to eq 5595
  end

  it 'finds a random item in a repository' do
    allow(@repo).to receive(:rand) { 1 }
    result = @repo.random
  end

end
