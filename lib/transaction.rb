require_relative 'sales_engine'

class Transaction
  attr_accessor :id, :invoice_id, :cc_number, :cc_expiration_date, :result, :created_at, :updated_at
  attr_reader :repo

  def initialize(attributes, repo)
    @repo               = repo
    @id                 = attributes[:id]
    @invoice_id         = attributes[:invoice_id]
    @cc_number          = attributes[:credit_card_number]
    @cc_expiration_date = attributes[:credit_card_expiration_date]
    @result             = attributes[:result]
    @created_at         = attributes[:created_at]
    @updated_at         = attributes[:updated_at]
  end

  def invoice
    repo.find_invoice_by_invoice_id(invoice_id)
  end
end
