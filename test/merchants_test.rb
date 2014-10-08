require_relative 'test_helper'

class MerchantsTest < Minitest::Test

  attr_reader :merchant, :repository

  def setup
    data = {id: "1",
            name: "Schroeder-Jerde",
            created_at: "2012-03-27 14:53:59 UTC",
            updated_at: "2012-03-27 14:53:59 UTC"
          }
    @repository = Minitest::Mock.new
    @merchant = Merchants.new(data, repository)
  end

  def test_it_has_a_repository
    assert merchant.repository
  end

  def test_it_has_an_id
    assert_equal "1", merchant.id
  end

  def test_it_has_a_name
    assert_equal "schroeder-jerde", merchant.name
  end

  def test_it_has_meta_data
    assert_equal "2012-03-27", merchant.created_at
    assert_equal "2012-03-27", merchant.updated_at
  end

  def test_it_delegates_items_to_repository
    repository.expect(:find_items_for, [], ["1"])
    merchant.items
    repository.verify
  end

  def test_it_delagates_invoices_to_repository
    repository.expect(:find_invoices_for, [], ["1"])
    merchant.invoices
    repository.verify
  end

end
