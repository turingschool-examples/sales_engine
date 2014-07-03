require 'csv'
require_relative 'customer_entry'
require_relative 'repository'

class CustomerRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @objects << CustomerEntry.new(row)
    end
  end

  attr_reader :objects

end
