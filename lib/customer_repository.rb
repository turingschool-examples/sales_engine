class CustomerRepository
  def initialize
    @customers_array = []
  end

  def parse(file)
    create_customers(file)
  end

  def create_customers(file)
    attributes_for_customers = []

    CSV.open(file, headers:true) do |customer|
      customers = customer.each
      attributes_for_customers = customers.map do |row|
        {
          id: row['id'],
          first_name: row['first_name'],
          last_name: row['last_name'],
          created_at: row['created_at'],
          updated_at: row['updated_at']
        }
      end
    end

    attributes_for_customers.each do |customer_attrs|
      customer = Customer.new(customer_attrs, self)
      add(customer)
    end
  end

  def add(customer)
    @customers_array << customer
  end

  def random
    @customers_array.shuffle[0]
  end

  def find_by_last_name(name)
    found = []
    while found.empty?
      @customers_array.each do |customer|
        if customer.last_name == name
          found << customer
        end
      end
    end
    found.first
  end

  def find_all_by_first_name(name)
    found = []
    @customers_array.each do |customer|
      if customer.first_name == name
        found << customer
      end
    end
    found
  end
end
