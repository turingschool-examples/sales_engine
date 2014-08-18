require 'csv'

module Parser
  def parse(filename)
    # path     = File.realdirpath(__FILE__)
    filepath = File.join('data', filename)
    data     = CSV.open(filepath, headers: true, header_converters: :symbol)
  end
end
