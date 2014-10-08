class InvoiceRepository
	attr_reader :invoices, :sales_engine

	def initialize(invoices, sales_engine)
		@invoices     = invoices
		@sales_engine = sales_engine
	end

	def all
		@invoices
	end

	def random
		invoices
	end

	def find_by(attribute, value)
		invoices.find {|invoice| invoice.send(attribute.to_sym) == value}
	end

	def find_all_by(attribute, value)
		invoices.find_all {|invoice| invoice.send(attribute.to_sym) == value}
	end

	def find_by_id(value); find_by(:id, value) end
	def find_by_customer_id(value); find_by(:customer_id, value) end
	def find_by_merchant_id(value); find_by(:merchant_id, value) end
	def find_by_status(value); find_by(:status, value.downcase) end
	def find_by_created_at(value); find_by(:created_at, value) end
	def find_by_updated_at(value); find_by(:updated_at, value) end

	def find_all_by_id(value); find_all_by(:id, value) end
	def find_all_by_customer_id(value); find_all_by(:customer_id, value) end
	def find_all_by_merchant_id(value); find_all_by(:merchant_id, value) end
	def find_all_by_status(value); find_all_by(:status, value.downcase) end
	def find_all_by_created_at(value); find_all_by(:created_at, value) end
	def find_all_by_updated_at(value); find_all_by(:updated_at, value) end

 	def find_transactions_for(id)
		sales_engine.find_transactions_by_invoice(id)
	end

	def find_invoice_items_for(id)
		sales_engine.find_invoice_items_by_invoice(id)
	end

	def find_items_for(id)
		sales_engine.find_items_by_invoice(id)
	end

	def find_customer_for(id)
		sales_engine.find_customer_by_invoice(id)
	end

	def find_merchant_for(id)
		sales_engine.find_merchant_by_invoice(id)
	end
end