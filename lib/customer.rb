class Customer
	attr_reader :id,
						  :first_name,
						  :last_name,
						  :created_at,
						  :updated_at,
						  :repository

	def initialize(data, repository)
		@id         = data[:id]
		@first_name = data[:first_name].downcase
		@last_name  = data[:last_name].downcase
		@created_at = data[:created_at].split(" ")[0]
		@updated_at = data[:updated_at].split(" ")[0]
		@repository = repository
	end

	def invoices
		repository.find_invoices_for(id)
	end
end