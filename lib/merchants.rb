class Merchants

  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  def initialize(data)
    @id         = data[:id]
    @name       = data[:name].downcase
    @created_at = data[:created_at].split(" ")[0]
    @updated_at = data[:created_at].split(" ")[0]
  end

end
