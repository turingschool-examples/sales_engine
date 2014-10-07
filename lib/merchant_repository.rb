require_relative 'repository'

class MerchantRepository
  include Repository

  def initialize(merchants)
    @entries = merchants
    create_methods
  end

  private

  def attributes
    %w(id name created_at updated_at)
  end
end
