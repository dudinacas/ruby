class Product

  def self.initIdCount
    @@id_identifier = 0
  end

  def initialize(name, price, quantity)
    @id = @@id_identifier
    @@id_identifier += 1

    @name = name
    @price = price
    @quantity = quantity
  end

  def name
    @name
  end

  def id
    @id
  end

  def price
    @price
  end

  def quantity
    @quantity
  end

  def identify
    puts "#@quantity amount of ID #@id name #@name at #@price"
  end

  attr_accessor :price
  attr_accessor :quantity
end

class Inventory

  def initialize
    @items = []
  end

  def add(item)
    @items.push(item)
  end

  def value
    price = @items.map{ |x| x.price * x.quantity }
    price.sum
  end
end

def printValue(inventory)
  puts "Total value of Inventory #{inventory}:"
  puts "$#{inventory.value}"
end

# Program main loop

meat = Inventory.new

Product.initIdCount

fish = Product.new("Fish", 10, 5)
lamb = Product.new("Lamb", 8, 9)
pork = Product.new("Pork", 6, 20)
beef = Product.new("Beef", 15, 5)

[fish, lamb, pork, beef].each do |item|
  meat.add(item)
  item.identify
end

printValue(meat)
