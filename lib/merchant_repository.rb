require_relative 'repository'

class MerchantRepository
  include Repository

  def initialize(merchants)
    @entries = merchants
  end

  def attributes
    %w(id name created_at updated_at)
  end
  
end
