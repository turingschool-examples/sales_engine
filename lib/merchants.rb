class Merchants

  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id         = data[:id]
    @name       = data[:name].downcase
    @created_at = data[:created_at].split(" ")[0]
    @updated_at = data[:created_at].split(" ")[0]
    @repository = repository
  end

  def items
    repository.find_items_for(id)
  end

  def invoices
    repository.find_invoices_for(id)
  end
end
