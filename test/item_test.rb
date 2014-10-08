require_relative 'test_helper'

class ItemTest < Minitest::Test

	attr_reader :item, :repository

	def setup
		data = {id: "1",
						name:"Item Qui Esse",
						description: "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.",
						unit_price: "75107",
						merchant_id: "1",
						created_at: "2012-03-27 14:53:59 UTC",
						updated_at: "2012-03-27 14:53:59 UTC"
						}

		@repository = Minitest::Mock.new
		@item = Item.new(data, repository)
	end

	def test_it_exits
		assert Item
	end

	def test_it_has_an_id
		assert_equal "1", item.id
	end

	def test_an_item_has_a_name
		assert_equal "item qui esse", item.name
	end

	def test_an_item_has_a_description
		assert_equal "nihil autem sit odio inventore deleniti. est laudantium ratione distinctio laborum. minus voluptatem nesciunt assumenda dicta voluptatum porro." , item.description
	end

	def test_an_item_has_a_unit_price
		assert_equal "75107", item.unit_price
	end

	def test_an_item_has_a_merchant_id
		assert_equal "1", item.merchant_id
	end

	def test_an_item_has_meta_data
		assert_equal "2012-03-27", item.created_at
		assert_equal "2012-03-27", item.updated_at
	end

	def test_it_has_a_repository
		assert item.repository
	end

	def test_it_delegates_items_to_repository
		repository.expect(:find_items_from, [], ["1"])
		item.items
		repository.verify
	end

	def test_it_delegates_invoices_to_repositoy
		repository.expect(:find_items_from, [], ["1"])
		item.invoices
		repository.verify
	end

	def test_it_delegates_merchants_to_repositoy
		repository.expect(:find_items_from, [], ["1"])
		item.merchants
		repository.verify
	end
end
