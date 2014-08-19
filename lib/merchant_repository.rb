require_relative 'merchant'
require_relative 'parser'

class MerchantRepository < Repository
  extend Parser

  def self.collection
    @collection ||= load_entries(Merchant, 'merchants.csv')
  end

end
