class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name}
  end

  def vendors_that_sell(item)
      a = @vendors.find_all { |vendor| vendor.inventory.include?(item) }
  end

  def total_inventory
    item_totals = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.reduce(Hash.new(0)) do |total, item|
        item_totals[item.first] = {quantity: item.last, vendors: vendors_that_sell(item.first)}
      end
    end
    item_totals
  end
end

# pry(main).overstocked_items
# #=> [#<Item:0x007f9c56740d48...>]
#
# pry(main)> market.sorted_item_list
# #=> ["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"]
