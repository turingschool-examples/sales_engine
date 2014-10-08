class MerchantRepository
	attr_reader :merchants, :sales_engine

	def initialize(merchants, sales_engine)
		@merchants    = merchants
		@sales_engine = sales_engine
	end

	def all
		@merchants
	end

	def random
		@merchant.sample
	end

	def find_by(attribute, value)
		merchants.find {|merchant| merchant.send(attribute.to_sym) == value}
	end

	def find_all_by(attribute, value)
		merchants.find_all {|merchant| merchant.send(attribute.to_sym) == value}
	end

	def find_by_id(value); find_by(:id, value) end
	def find_by_name(value); find_by(:name, value.downcase) end
	def find_by_created_at(value); find_by(:created_at, value) end
	def find_by_updated_at(value); find_by(:updated_at, value) end

	def find_all_by_id(value); find_all_by(:id, value) end
	def find_all_by_name(value); find_all_by(:name, value.downcase) end
	def find_all_by_created_at(value); find_all_by(:created_at, value) end
	def find_all_by_updated_at(value); find_all_by(:updated_at, value) end

	def find_items_for(id)
		sales_engine.find_items_by_merchant(id)
	end

	def find_invoices_for(id)
		sales_engine.find_invoices_by_merchant(id)
	end
end