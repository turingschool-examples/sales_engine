require 'csv'
require_relative 'customer'
require_relative 'repository'

class CustomerRepository < Repository


  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      objects << Customer.new(row)
    end
    new(objects)
  end

  attr_reader :objects

end
