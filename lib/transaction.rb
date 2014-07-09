class Transaction

  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at

  attr_accessor :invoice,
                :merchant

  def initialize(data)
    @id                          = data[:id].to_i
    @invoice_id                  = data[:invoice_id].to_i
    @credit_card_number          = data[:credit_card_number]
    @credit_card_expiration_date = data[:credit_card_expiration_date]
    @result                      = data[:result]
    @created_at                  = data[:created_at]
    @updated_at                  = data[:updated_at]
    @invoice                     = data[:invoice]
    @merchant                    = data[:merchant]
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def merchant
    @invoice.merchant
  end

end
