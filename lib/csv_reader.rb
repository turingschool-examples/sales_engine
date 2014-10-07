require 'csv'
class CSVReader
  def read(file_name)
    file_name = File.join "data", file_name
    csv       = CSV.table(file_name, :header_converters => :symbol)
  end
end
