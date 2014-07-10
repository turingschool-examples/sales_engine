require_relative 'customer_repository_helper'

class CustomerRepository < Repository

  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) {|row| objects << Customer.new(row)}
    new(objects)
  end

end
