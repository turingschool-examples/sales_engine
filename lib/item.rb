class Item
	attr_reader :id,
							:name,
							:description,
							:unit_price,
							:merchant_id,
							:created_at,
							:updated_at,
							:repository

	def initialize(data, repository)
		@id          = data[:id]
		@name        = data[:name].downcase
		@description = data[:description].downcase
		@unit_price  = data[:unit_price]
		@merchant_id = data[:merchant_id]
		@created_at  = data[:created_at].split(" ")[0]
		@updated_at  = data[:updated_at].split(" ")[0]
		@repository	 = repository
	end

	def items
		repository.find_items_from(id)
	end

	def invoices
		repository.find_items_from(id)
	end

	def merchants
		repository.find_items_from(id)
	end

end
