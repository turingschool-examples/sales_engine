class CustomerParser

  def initialize(file_path)
    @parser = Parser.new(file_path)
  end

  def all
    @parser.rows.map {|row| Customer.new(row)}
  end
end
