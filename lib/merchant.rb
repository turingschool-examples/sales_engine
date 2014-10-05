require 'time'

class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repo

  def initialize(data, repo)
    @id =         data[:id].to_i
    @name =       data[:name]
    @created_at = Time.parse(data[:created_at])
    @updated_at = Time.parse(data[:updated_at])
    @repo =       repo
  end

  def items
  end

  def invoices
  end

end
