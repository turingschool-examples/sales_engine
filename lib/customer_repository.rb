class CustomerRepository
  def initialize
    @customers = []
  end

  def add(customer)
    @customers << customer
  end

  def random
    all.sample
  end

  def find_by_last_name(name)
    all.find { |customer|
      customer.last_name == name
    }
  end

  def find_all_by_first_name(name)
    all.select { |customer|
      customer.first_name == name
    }
  end

  private

  def all
    @customers
  end
end
