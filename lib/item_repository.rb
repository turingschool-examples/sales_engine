class ItemRepository
	attr_reader :items

	def initialize(file_path)
		@items = ItemParser.new(file_path).all
	end

end