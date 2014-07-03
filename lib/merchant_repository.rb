require          'csv'
require_relative 'merchant_entry'
require_relative 'repository'

class MerchantRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @entries << EntryMerchant.new(row)
    end
  end

  attr_reader :entries

end
