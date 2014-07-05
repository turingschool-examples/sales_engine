require 'csv'
require_relative 'customer'
require_relative 'repository'

class CustomerRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @objects << Customer.new(row)
    end
  end

  attr_reader :objects

end
