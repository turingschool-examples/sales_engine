require 'csv'

module CSVParser

  def self.load_csv(file_name)
    csv = CSV.table(file_name, :header_converters => :symbol, :converters => :all)
  end

end
