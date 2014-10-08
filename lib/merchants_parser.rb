class MerchantsParser
  attr_reader :parser

  def initialize(file_path)
    @parser = Parser.new(file_path)
  end

  def all
    parser.rows.map {|row| Merchants.new(row)}
  end
end
