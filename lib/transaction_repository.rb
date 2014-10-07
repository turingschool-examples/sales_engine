require_relative 'repository'

class TransactionRepository
  include Repository

  def initialize(transactions)
    @entries = transactions
    create_methods
  end

  def attributes
    %w(id invoice_id credit_card_number credit_card_expiration_date result created_at updated_at)
  end
end
