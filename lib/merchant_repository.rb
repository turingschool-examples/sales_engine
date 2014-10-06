require_relative 'merchant'
require_relative 'finder_methods'
require 'csv'

class MerchantRepository
  include FinderMethods

  attr_reader :instances, :engine

  def initialize(directory, engine)
    file =    File.join(directory, 'merchants.csv')
    data =    CSV.open(file, headers: true, header_converters: :symbol)
    @instances =  data.map { |row| Merchant.new(row.to_hash, self) }
    @engine = engine
  end
end
