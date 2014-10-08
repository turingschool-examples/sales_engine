class CustomerRepository
	attr_reader :customers, :sales_engine

	def initialize(customers, sales_engine)
		@customers    = customers
		@sales_engine = sales_engine
	end

	def all
		customers
	end

	def random
		customer.sample
	end

	def find_by(attribute, value)
		customers.find {|customer| customer.send(attribute.to_sym) == value}
	end

	def find_all_by(attribute, value)
		customers.find_all {|customer| customer.send(attribute.to_sym) == value}
	end

	def find_by_id(value); find_by(:id, value) end
	def find_by_first_name(value); find_by(:first_name, value.downcase) end
	def find_by_last_name(value); find_by(:last_name, value.downcase) end
	def find_by_created_at(value); find_by(:created_at, value) end
	def find_by_updated_at(value); find_by(:updated_at, value) end

	def find_all_by_id(value); find_all_by(:id, value) end
	def find_all_by_by_first_name(value); find_all_by(:first_name, value.downcase) end
	def find_all_by_last_name(value); find_all_by(:last_name, value.downcase) end
	def find_all_by_created_at(value); find_all_by(:created_at, value) end
	def find_all_by_updated_at(value); find_all_by(:updated_at, value) end

	def find_invoices_for(id)
		sales_engine.find_invoices_by_customer(id)
	end
end