require_relative 'repository'

class TransactionRepository
  include Repository

  def initialize(transactions)
    @entries = transactions
    create_methods
  end

  def give_invoices_from(invoice_repository)
  	entries.each do |invoice|
  		transacation.give_invoice(invoice_repository.find_all_by_transaction_id(transacation.id))
  	end
  end

  private

  def attributes
    %w(id invoice_id credit_card_number credit_card_expiration_date result created_at updated_at)
  end
end
