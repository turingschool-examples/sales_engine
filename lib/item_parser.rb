class ItemParser
	attr_reader :items, :parser

	def initialize(file_path)
		@parser = Parser.new(file_path)
	end

	def all
		@items = parser.rows.map {|row| Item.new(row)}
	end	
end