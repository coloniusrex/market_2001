require 'minitest/autorun'
require './lib/vendor'
require './lib/item'

class VendorTest < Minitest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_it_has_attributes
    assert_equal "Rocky Mountain Fresh", @vendor.name
    expected = {}
    assert_equal expected, @vendor.inventory
  end

  def test_it_can_check_stock
    assert_equal 0,@vendor.check_stock(@item1)
  end

  def test_it_can_add_to_stock
    @vendor.stock(@item1, 30)
    assert_equal 30, @vendor.check_stock(@item1)
  end

  def test_added_stock_appears_in_inventory
    @vendor.stock(@item1, 30)
    expected = {@item1 => 30}
    assert_equal expected, @vendor.inventory
    @vendor.stock(@item1, 25)
    expected_1 = {@item1 => 55}
    assert_equal expected_1, @vendor.inventory
  end
end
