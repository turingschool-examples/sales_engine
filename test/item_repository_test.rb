require_relative 'test_helper'

class ItemRepositoryTest < Minitest::Test
  attr_reader :repository,
              :items,
              :item1,
              :item2,
              :item3,
              :expected_find_by_all_values,
              :expected_find_by_values,
              :search_terms

  def setup
    item_setup   

    @repository = ItemRepository.new(items)

    @search_terms = {
      id: "1",
      name: "Soap",
      description: "Minty fresh",
      price: "300",
      merchant_id: "1",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
      }

    @expected_find_by_all_values = {
      id: [item1],
      name: [item1],
      description: [item1, item3],
      price: [item2, item3],
      merchant_id: [item1, item2],
      created_at: [item1, item3],
      updated_at: [item1, item3]
      }

    @expected_find_by_values = {
      id: item1,
      name: item1,
      description: item1,
      price: item2,
      merchant_id: item1,
      created_at: item1,
      updated_at: item1
      }
  end

  def item_setup
    item1_data = { id: "1",
             name: "Soap",
             description: "Minty fresh",
             price: "150",
             merchant_id: "1",
             created_at: "2012-03-27 14:53:59 UTC",
             updated_at: "2012-03-27 14:53:59 UTC" }
    item2_data = { id: "2",
             name: "Toothpaste",
             description: "Not actually minty",
             price: "300",
             merchant_id: "1",
             created_at: "2012-03-28 14:53:59 UTC",
             updated_at: "2012-03-28 14:53:59 UTC" }
    item3_data = { id: "3",
             name: "Toothpaste",
             description: "Minty Fresh",
             price: "300",
             merchant_id: "2",
             created_at: "2012-03-27 14:53:59 UTC",
             updated_at: "2012-03-27 14:53:59 UTC" }
    @item1 = Item.new(item1_data)
    @item2 = Item.new(item2_data)
    @item3 = Item.new(item3_data)

    @items = [item1, item2, item3 ]
  end

  def test_a_new_it_is_empty
    other_repository = ItemRepository.new
    assert_empty(other_repository.all)
  end

  def test_it_can_return_all_items
    assert_equal items, repository.all
  end

  def test_it_has_a_random_method_which_returns_an_item
    assert_instance_of(Item, repository.random)
  end

  [:id, :name, :description, :price, :merchant_id, :created_at, :updated_at].each do |attribute|
    define_method("test_it_can_find_by_#{attribute}".to_sym) do 
      assert_equal expected_find_by_values[attribute], repository.send("find_by_#{attribute}".to_sym, search_terms[attribute])
    end
  end

  [:id, :name, :description, :price, :merchant_id, :created_at, :updated_at].each do |attribute|
    define_method("test_it_can_find_all_by_#{attribute}".to_sym) do 
      assert_equal expected_find_by_all_values[attribute], repository.send("find_all_by_#{attribute}".to_sym, search_terms[attribute])
    end
  end
end