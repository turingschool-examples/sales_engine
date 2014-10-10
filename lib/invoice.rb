class Invoice
	attr_reader :id, :customer_id, :merchant_id, :status, :created_at,
							:updated_at, :transactions, :invoice_items, :items,
							:customer, :merchant

	def initialize(data)
		@id = data[:id]
		@customer_id = data[:customer_id]
		@merchant_id = data[:merchant_id]
		@status = data[:status]
		@created_at = data[:created_at]
		@updated_at = data[:updated_at]
	end

	def give_transactions(transactions)
		@transactions = transactions
	end

  def give_invoice_items(invoice_items)
		@invoice_items = invoice_items
	end

  def give_items(items)
		@items = items
	end

  def give_customer(customer)
		@customer = customer
	end

  def give_merchant(merchant)
		@merchant = merchant
	end

	def pending?
		transactions.none? { |transaction| transaction.result == "success" }
	end

	def successful?
		!pending?
	end

	def inspect
		"<#{self.class} ID: #{id}>"
	end

end
