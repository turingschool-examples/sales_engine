class Customer

  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  attr_accessor :invoices,
                :transactions

  def initialize(data)
    @id         = data[:id].to_i
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def transactions
    transactions = []
    invoices.each do |invoice|
      transactions += invoice.transactions
    end
    transactions
  end
  
end
