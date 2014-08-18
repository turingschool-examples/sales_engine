class Transaction
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at

  def initialize(data)
    @id                          = data[:id]
    @invoice_id                  = data[:invoice_id]
    @credit_card_number          = data[:credit_card_number]
    @credit_card_expiration_date = data[:credit_card_expiration_date]
    @result                      = data[:result]
    @created_at                  = data[:created_at]
    @updated_at                  = data[:updated_at]
  end
end
