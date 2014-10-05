require_relative 'item_repository'

module FinderMethods
  # TODO use only correct attriutes for type?
  def self.attributes
    [
    'id',
    'customer_id',
    'merchant_id',
    'item_id',
    'invoice_id',
    'credit_card_number',
    'credit_card_expiration_date',
    'result',
    'quantity',
    'first_name',
    'last_name',
    'status',
    'name',
    'description',
    'unit_price',
    'merchant_id',
    'created_at',
    'updated_at'
    ]
  end

  def all
    instances
  end

  def random
    instances.sample
  end

  attributes.each do |attribute|
    define_method("find_by_#{attribute}") do |input|
      instances.detect do |instance|
        input.to_s.downcase == instance.send(attribute).to_s.downcase
      end
    end
    define_method("find_all_by_#{attribute}") do |input|
      instances.select do |instance|
        input.to_s.downcase == instance.send(attribute).to_s.downcase
      end
    end
  end
end
