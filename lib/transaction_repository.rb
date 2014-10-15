require_relative 'repository'

class TransactionRepository
  include Repository

  def initialize(transactions)
    @entries = transactions
    create_methods
  end

  def set_relations(repo)
    set_invoices(repo.first)
  end

  def set_invoices(invoice_repo)
    entries.each do |transaction|
    transaction.assign_invoice(invoice_repo.find_by_id(transaction.invoice_id))
    end
  end

  private

  def attributes
    %w(id invoice_id credit_card_number credit_card_expiration_date result
       created_at updated_at)
  end
end
