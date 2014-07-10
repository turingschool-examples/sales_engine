class Relationships


  def relation
    merchant_relationship
    invoice_item_relationship
    invoice_relationship
    item_relationship
    transaction_relationship
    customer_relationship
  end

  def merchant_relationship
    merchant_repository.all.each do |merchant|
      merchant.invoices ||= invoice_repository.find_all_by_merchant_id(merchant.id)
      merchant.items    ||= item_repository.find_all_by_merchant_id(merchant.id)
    end
  end

  def invoice_item_relationship
    invoice_item_repository.all.each do |invoice_item|
      invoice_item.invoice ||= invoice_repository.find_by_id(invoice_item.invoice_id)
      invoice_item.item    ||= item_repository.find_by_id(invoice_item.item_id)
    end
  end

  def invoice_items_list(invoice)
    invoice.invoice_items.map do |invoice_item|
      invoice_item.item
    end
  end

  def invoice_relationship
    invoice_repository.all.each do |invoice|
      invoice.transactions  ||= transaction_repository.find_all_by_invoice_id(invoice.id)
      invoice.invoice_items ||= invoice_item_repository.find_all_by_invoice_id(invoice.id)
      invoice.customer      ||= customer_repository.find_by_id(invoice.customer_id)
      invoice.items         ||= invoice_items_list(invoice)
      invoice.merchant      ||= merchant_repository.find_by_id(invoice.merchant_id)
    end
  end

  def item_relationship
    item_repository.all.each do |item|
      item.invoice_items ||= invoice_item_repository.find_all_by_item_id(item.id)
      item.merchant      ||= merchant_repository.find_by_id(item.merchant_id)
    end
  end

  def transaction_relationship
    transaction_repository.all.each do |transaction|
      transaction.invoice ||= invoice_repository.find_by_id(transaction.invoice_id)
    end
  end

  def customer_relationship
    customer_repository.all.each do |customer|
      customer.invoices ||= invoice_repository.find_all_by_customer_id(customer.id)
    end
  end
end
