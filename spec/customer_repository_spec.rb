require 'customer_repository'

describe CustomerRepository do
  it "loads csv data" do
    repo = CustomerRepository
    expect(repo.collection).not_to be_empty
  end
end
