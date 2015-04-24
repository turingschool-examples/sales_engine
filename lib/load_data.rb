require 'csv'

module LoadData
  def load_data(filename, path = "fixtures")
    CSV.open "./#{path}/#{filename}.csv", headers: true, header_converters: :symbol
  end
end
