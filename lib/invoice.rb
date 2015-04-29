require 'date'

class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repo

  def initialize(attributes, repo)
    @repo          = repo
    @id            = attributes[:id].to_i
    @customer_id   = attributes[:customer_id].to_i
    @merchant_id   = attributes[:merchant_id].to_i
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

  def charge(attributes)
    transaction_data = {
      invoice_id: id,
      cc_number: attributes[:credit_card_number],
      cc_expiration_date: attributes[:credit_card_expiration],
      result: attributes[:result]
    }

    repo.add_transaction(transaction_data)
  end

end
