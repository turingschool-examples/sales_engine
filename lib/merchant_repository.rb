require_relative 'repository'

class MerchantRepository
  include Repository

  def initialize(merchants)
    @entries = merchants
  end

  %w(id name created_at updated_at).each do |attribute|
    define_method "find_by_#{attribute}" do |value|
      find_by(__method__[8..-1], value)
    end

    define_method "find_all_by_#{attribute}" do |value|
      find_all_by(__method__[12..-1], value)
    end
  end

end
