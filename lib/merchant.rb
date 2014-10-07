class Merchant

  attr_reader :id, :name, :created_at, :updated_at

  def initialize(data)
    @id                 = data[:id]
    @name               = data[:name]
    @created_at         = data[:created_at]
    @updated_at         = data[:updated_at]
  end

  def items
    #return array of associated item objects
  end

  def invoices
    #returns array of invoice objects
  end
end
