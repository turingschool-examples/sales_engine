require          'csv'
require_relative 'merchant'
require_relative 'repository'

class MerchantRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @objects << Merchant.new(row)
    end
  end

  attr_reader :objects

end
