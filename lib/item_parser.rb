class ItemParser
	attr_reader :path, :items

	def initialize(file_path)
		@path = file_path
	end

	def all
		parser = Parser.new(path)
		@items = parser.rows.map {|row| Item.new(row)}
	end	
end