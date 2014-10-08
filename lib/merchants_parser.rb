class MerchantsParser
	attr_reader :rows, :repository

  def initialize(file_path, repository)
    @repository = repository
    @rows = CSV.open(file_path, headers: true, header_converters: :symbol)
  end

  def all
    rows.map {|row| Merchants.new(row, repository)}
  end
end
