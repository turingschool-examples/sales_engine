class MerchantsParser

  def initialize(file_path)
    @rows = CSV.open(file_path, headers: true, header_converters: :symbol)
  end

  def all
    @rows.map {|row| Merchants.new(row)}
  end
end
