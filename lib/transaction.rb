class Transaction
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at

  def initialize(data)
    @id          = data[:id]
    @customer_id = data[:invoice_id]
    @merchant_id = data[:credit_card_number]
    @status      = data[:credit_card_expiration_date]
    @result      = data[:result]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
  end
end
