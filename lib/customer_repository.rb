require_relative 'repository'
require_relative 'customer'

class CustomerRepository < Repository

  attr_reader :repo

  def initialize
    @repo = []
  end

  def find_by_id(arg); finder(:id, arg); end
  def find_by_first_name(arg); finder(:first_name, arg); end
  def find_by_last_name(arg); finder(:last_name, arg); end
  def find_by_created_at(arg); finder(:created_at, arg); end
  def find_by_updated_at(arg); finder(:updated_at, arg); end

end
