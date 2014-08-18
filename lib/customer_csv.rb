require_relative 'parser'
require_relative 'customer'

class CustomerCSV
  include Parser

  def initialize(filename)
    @entries = parse(filename).map { |row| Customer.new(row) }
  end

end
