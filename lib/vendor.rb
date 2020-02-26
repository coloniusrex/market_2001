class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    if @inventory[item] == 0
    @inventory[item] = quantity
    else
    @inventory[item] += quantity
    end
  end

  def potential_revenue
    revenue = 0
    @inventory.each do |item, quantity|
      revenue += (item.price * quantity)
    end
    revenue
  end
end
