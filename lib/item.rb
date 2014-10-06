class Item
	attr_reader :id,
							:name,
							:description,
							:unit_price,
							:merchant_id,
							:created_at,
							:updated_at

	def initialize(data)
		@id          = data[:id]
		@name        = data[:name].downcase
		@description = data[:description].downcase
		@unit_price  = data[:unit_price]
		@merchant_id = data[:merchant_id]
		@created_at  = data[:created_at].split(" ")[0]
		@updated_at  = data[:updated_at].split(" ")[0]
	end

end