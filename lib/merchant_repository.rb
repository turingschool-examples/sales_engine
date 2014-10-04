class MerchantRepository
  attr_reader :engine
  
  def initialize(engine)
    @engine = engine
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_x(match)

  end

  def find_all_by_x(match)

  end
end
