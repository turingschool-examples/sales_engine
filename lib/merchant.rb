class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repo,
              :successful_invoices

  def initialize(attributes, repo)
    @repo       = repo
    @id         = attributes[:id].to_i
    @name       = attributes[:name]
    @created_at = attributes[:created_at]
    @updated_at = attributes[:updated_at]
  end

  def items
    repo.find_all_items_by_merchant_id(id)
  end

  def invoices
    repo.find_all_invoices_by_merchant_id(id)
  end

  def revenue(date = nil)
    if date.nil?
      total_revenue
    else
      revenue_for_date(date)
    end
  end

  def total_revenue
    @total_revenue ||=
      calculate_revenue_of_invoice_items(successful_invoice_items)
  end

  def invoice_items_by_date(date)
    invoices = successful_invoices_by_date(date)
    repo.successful_invoice_items.select do |invoice_item|
      invoices.any? do |invoice|
        invoice.id == invoice_item.invoice_id
      end
    end
  end

  def revenue_for_date(date)
    calculate_revenue_of_invoice_items(invoice_items_by_date(date))
  end

  def calculate_revenue_of_invoice_items(invoice_items)
    invoice_items.reduce(0) do |sum, inv_item|
      sum + (inv_item.unit_price / 100) * inv_item.quantity
    end
  end

  def customers
    successful_invoices.map { |invoice| invoice.customer }
  end

  def favorite_customer
    customers.max_by { |customer| customers.count(customer) }
  end

  def pending_invoices
    invoices - successful_invoices
  end

  def customers_with_pending_invoices
    pending_invoices.flat_map do |invoice|
      repo.find_customers_with_pending_invoices(invoice)
    end
  end

  def successful_invoice_items
    @successful_invoice_items ||=
      repo.successful_invoice_items.select do |invoice_item|
        successful_invoices.any? do |invoice|
          invoice.id == invoice_item.invoice_id
        end
      end
  end

  def successful_invoices
    @successful_invoices ||=
      repo.successful_invoices.select { |invoice| invoice.merchant_id == id }
  end

  def successful_invoices_by_date(date)
    successful_invoices.select do |invoice|
      Date.parse(invoice.created_at) == date
    end
  end

  def total_items_sold
    @total_items_sold ||=
      successful_invoice_items.reduce(0) do |sum, invoice_item|
        sum + invoice_item.quantity
      end
  end
end



