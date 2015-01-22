class CustomerParser
  attr_reader :file, :repo

  def self.parse(file, customer_repo)
    new(file, customer_repo).call
  end

  def initialize(file, customer_repo)
    @file = file
    @repo = customer_repo
  end

  def call
    create_customers
  end

  private

  def create_customers
    attributes_for_customers.each do |customer_attrs|
      customer = Customer.new(customer_attrs, repo)
      repo.add(customer)
    end
  end

  def attributes_for_customers
    CSV.open(file, headers:true) do |customer|
      customers = customer.each
      customers.map do |row|
        {
          id: row['id'],
          first_name: row['first_name'],
          last_name: row['last_name'],
          created_at: row['created_at'],
          updated_at: row['updated_at']
        }
      end
    end
  end
end
