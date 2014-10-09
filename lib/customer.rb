class Customer
	attr_reader :id, :first_name, :last_name, :created_at, :updated_at, :invoices

	def initialize(data)
		@id = data[:id]
		@first_name = data[:first_name]
		@last_name 	= data[:last_name]
		@created_at = data[:created_at]
		@updated_at = data[:updated_at]
	end

	def give_invoices(invoices)
		@invoices = invoices
	end

	def transactions
		@invoices.map { |invoice| invoice.transactions }.flatten
	end

	def successful_purchases
		transactions.select { |transaction| transaction.result == "success" }
	end

	def sales_by_merchant
		successful_purchases.group_by { |transaction| transaction.invoice.merchant }
	end


	def favorite_merchant
		sales_by_merchant.max_by { |merchant, transactions| transactions.size }[0]
	end

end
