class InvoiceItemParser
	attr_reader :invoice_items, :parser

	def initialize(file_path)
		@parser = Parser.new(file_path)
	end

	def all
		@invoice_items = parser.rows.map {|row| InvoiceItem.new(row)}
	end
end

