class ItemParser

	attr_reader :rows, :repository

	def initialize(file_path, repository)
		@rows = CSV.open(file_path, headers: true, header_converters: :symbol)
	end

	def all
		@rows.map {|row| Item.new(row, repository)}
	end
end
