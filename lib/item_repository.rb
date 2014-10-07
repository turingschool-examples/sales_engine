require_relative 'repository'

class ItemRepository
  include Repository

  def initialize(items)
    @entries = items
    create_methods
  end

  def attributes
    %w(id name description unit_price merchant_id created_at updated_at)
  end
end
