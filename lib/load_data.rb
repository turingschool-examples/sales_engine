require 'csv'

module LoadData

  def load_csv(path, filename)
    CSV.open "#{path}/#{filename}", headers: true, header_converters: :symbol
  end
end
