require 'csv'
require 'date'
require 'bigdecimal'
require 'bigdecimal/util'

class CSVReader
  def read(file_name, conversion=false)
    csv = Array.new
    file_name = File.join "data", file_name
    CSV.foreach(file_name, headers: true ,header_converters: :symbol, converters: :string_to_date_time) do |row|
      csv << row.to_hash
    end
    csv
  end
end
