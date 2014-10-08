class InvoiceRepository
	attr_reader :invoices, :sales_engine

	def initialize(invoices, sales_engine)
		@invoices = invoices
		@sales_engine = sales_engine
	end

	def all
		@invoices
	end

	def find_by(attribute, value)
		invoices.find {|invoice| invoice.send(attribute.to_sym) == value}
	end

	def find_all_by(attribute, value)
		invoices.find_all {|invoice| invoice.send(attribute.to_sym) == value}
	end


end