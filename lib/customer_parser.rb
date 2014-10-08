class CustomerParser

  def initialize(file_path)
    @rows = CSV.open(file_path, headers: true, header_converters: :symbol)
  end

  def all
    @rows.map {|row| Customer.new(row)}
  end
end
