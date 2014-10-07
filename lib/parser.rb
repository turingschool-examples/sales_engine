require 'csv'

class Parser
  attr_reader :parsed_array
  
  def initialize(repository_type, file_path)
    data = CSV.open(file_path, headers: true, header_converters: :symbol)
    @parsed_array = data.map {|row| repository_type.new(row) }
  end
end

