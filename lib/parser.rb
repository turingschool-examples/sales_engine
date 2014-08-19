require 'csv'

module Parser
  DATA_DIR = File.expand_path '../../data', __FILE__ 

  def load_entries(entry_type, file)
    parse(file).map { |row| entry_type.new(row) }
  end

  def parse(file)
    filepath = File.join(DATA_DIR, file)
    CSV.open(filepath, headers: true, header_converters: :symbol, converters: :date_time)
  end
end
