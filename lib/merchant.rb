class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  attr_accessor :invoices,
                :items

  def initialize(data)
    @id         = data[:id]
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end
end
