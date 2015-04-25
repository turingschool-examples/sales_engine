require_relative 'customer_repository'

class Customer
  attr_accessor :id, :first_name, :last_name, :created_at, :updated_at
  attr_reader :repo

  def initialize(attributes, repo)
    @repo       = repo
    @id         = attributes[:id]
    @first_name = attributes[:first_name]
    @last_name  = attributes[:last_name]
    @created_at = attributes[:created_at]
    @updated_at = attributes[:updated_at]
  end

  def invoices
    repo.find_invoices_by_customer_id(id)
  end
end
