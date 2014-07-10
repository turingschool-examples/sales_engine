class Customer

  attr_reader   :id,
                :first_name,
                :last_name,
                :created_at,
                :updated_at

  attr_accessor :invoices,
                :transactions

  def initialize(data)
    @id           = data[:id].to_i
    @first_name   = data[:first_name]
    @last_name    = data[:last_name]
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
    @invoices     = data[:invoices]
    @transactions = data[:transactions]
  end

  def transactions
    @invoices.reduce([]) { |sum, invoice| sum += invoice.transactions }
  end

  def favorite_merchant
    merchants = transactions.collect { |t| t.merchant if t.result == 'success'}.flatten
    merchants.group_by { |item| item }.values.max_by(&:size).first
  end

end
