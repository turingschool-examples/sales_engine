class ItemParser

	attr_reader :rows

	def initialize(file_path)
		@rows = CSV.open(file_path, headers: true, header_converters: :symbol)
	end

	def all
		@rows.map {|row| Item.new(row)}
	end
end
