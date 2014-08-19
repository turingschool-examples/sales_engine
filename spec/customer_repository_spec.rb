require 'customer_repository'

describe CustomerRepository do
  before(:each) do
    @repo = CustomerRepository
  end

  it "loads csv data" do
    expect(@repo.collection).not_to be_empty
  end

  it 'finds all items in a repository' do
    expect(@repo.all.count).to eq 1000
  end

  it 'finds a random item in a repository' do
    allow(@repo).to receive(:rand) { 1 }
    result = @repo.random
  end

  it 'finds one item in a repository by attribute'
  it 'finds all items in a repository by attribute'
  it 'returns empty array if attribute count is nil'
end
