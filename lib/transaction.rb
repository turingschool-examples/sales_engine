class Transaction
  attr_accessor :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at

  def initialize
    @id
    @invoice_id
    @credit_card_number
    @credit_card_expiration_date
    @result
    @created_at
    @updated_at
  end
end
