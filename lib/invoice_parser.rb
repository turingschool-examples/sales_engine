class InvoiceParser
	attr_reader :invoices, :parser

	def initialize(file_path)
		@parser = Parser.new(file_path)
	end

	def all
		@invoices = parser.rows.map {|row| Invoice.new(row)}
	end
end