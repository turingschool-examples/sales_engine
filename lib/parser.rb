require 'csv'

class Parser
  attr_reader :items

  def initialize(repository_type, file_path)
    @file_path = file_path
    @repository_type = repository_type
    data = CSV.open(file_path, headers: true, header_converters: :symbol)

# somehow use repository_type variable to call the correct method below

# add class variable and drop that in below

  end

end
#all methods
  # @items = data.map {|row| Item.new(row)}
  # @merchants = data.map {|row| Merchants.new(row)}

# end
