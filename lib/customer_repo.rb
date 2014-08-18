require_relative 'customer_csv'

class CustomerRepo

  def initialize(filename)
    @collection = CustomerCSV.new(filename)
  end

end
