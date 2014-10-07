require 'csv'

class Parser
  attr_reader :rows
  
  def initialize(file_path)
    @rows = CSV.open(file_path, headers: true, header_converters: :symbol)
  end
end

