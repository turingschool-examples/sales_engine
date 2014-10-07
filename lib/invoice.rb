class Invoice
	attr_reader :id,
					  	:customer_id,
						  :merchant_id,
						  :status,
						  :created_at,
						  :updated_at

	def initialize(data)
		@id          = data[:id]
		@customer_id = data[:customer_id]
		@merchant_id = data[:merchant_id]
		@status      = data[:status].downcase
		@created_at  = data[:created_at].split(" ")[0]
		@updated_at  = data[:updated_at].split(" ")[0]
	end

end