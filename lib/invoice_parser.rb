class InvoiceParser

	def initialize(file_path)
		@parser = Parser.new(file_path)
	end

	def all
		@parser.rows.map {|row| Invoice.new(row)}
	end
end