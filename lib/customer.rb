class Customer
  attr_reader :id, :first_name, :last_name,
              :create_at, :updated_at

  def initialize(attrs={}, repo)
    @id         = attrs[:id]
    @first_name = attrs[:first_name]
    @last_name  = attrs[:last_name]
    @created_at = attrs[:created_at]
    @updated_at = attrs[:updated_at]
  end
end
