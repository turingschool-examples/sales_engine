class Parser

  def initialize(file_name)
    file_name = "items.csv"
    contents = CSV.open file_name, headers: true, header_converters: :symbol
    create_items(contents)
  end

  def create_items(contents)
    contents.map do |row|
      Item.new(row)
    end
  end

end
