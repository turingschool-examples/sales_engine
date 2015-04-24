require_relative 'invoice_repository'

class Invoice
  attr_accessor :id, :customer_id, :merchant_id, :status, :created_at, :updated_at
  attr_reader :repo

  def initialize(attributes, repo)
    @repo          = repo
    @id            = attributes[:id]
    @customer_id   = attributes[:customer_id]
    @merchant_id   = attributes[:merchant_id]
    @status        = attributes[:status]
    @created_at    = attributes[:created_at]
    @updated_at    = attributes[:updated_at]
  end

  def transactions
    repo.find_transactions_by_invoice_id(id)
  end

  def invoice_items
    repo.find_invoice_items_by_invoice_id(id)
  end

  def items
    invoice_items.map do |element|
      repo.find_items_by_item_id_through_invoice_items(element.item_id)
    end
  end

  def customer
    repo.find_customer_by_customer_id(customer_id)
  end

  def merchant
    repo.find_merchant_by_merchant_id(merchant_id)
  end
end
