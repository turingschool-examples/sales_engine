class Customer
	attr_reader :id, :first_name, :last_name, :created_at, :updated_at, :invoices

	def initialize(data)
		@id = data[:id]
		@first_name = data[:first_name]
		@last_name = data[:last_name]
		@created_at = data[:created_at]
		@updated_at = data[:updated_at]
	end

	def give_invoices(invoices)
		@invoices = invoices
	end

	def transactions
		transactions = []
		self.invoices.each do |invoice|
			if invoice.transaction == "success"
				transactions << invoice
			end
		end
		transactions
	end

	def favorite_merchant(transaction)
		# transactions.each do |transaction|
	end
end