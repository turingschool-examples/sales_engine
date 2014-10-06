require_relative 'test_helper'

class ItemTest < Minitest::Test 

	attr_reader :item

	def setup
		data = {id: 1,
						name:"Item Qui Esse",
						description: "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", 
						unit_price: 75107,
						merchant_id: 1,
						created_at: "2012-03-27 14:53:59 UTC",
						updated_at: "2012-03-27 14:53:59 UTC"
						}

		@item = Item.new(data)	
	end

	def test_it_has_an_id
		setup
		assert_equal 1, item.id
	end

	def test_an_item_has_a_name
		setup
		assert_equal "item qui esse", item.name
	end

	def test_an_item_has_a_description
		setup
		assert_equal "nihil autem sit odio inventore deleniti. est laudantium ratione distinctio laborum. minus voluptatem nesciunt assumenda dicta voluptatum porro." , item.description
	end

	def test_an_item_has_a_unit_price
		setup
		assert_equal 75107, item.unit_price
	end

	def test_an_item_has_a_merchant_id
		setup
		assert_equal 1, item.merchant_id
	end

	def test_an_item_has_meta_data
		setup
		assert_equal "2012-03-27", item.created_at
		assert_equal "2012-03-27", item.updated_at
	end
end
