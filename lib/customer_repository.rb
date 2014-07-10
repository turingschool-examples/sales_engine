require_relative 'customer_repository_helper'

class CustomerRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do
      |row| objects << Customer.new(row)
    end
    new(objects)
  end

end
