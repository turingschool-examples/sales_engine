require_relative 'parser'

class CustomerCSV
  include Parser

  def initialize(filename)
    @entries = parse(filename).map { |row| CustomerEntry.new(row) }
  end

end
