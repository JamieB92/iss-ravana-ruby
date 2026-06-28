class Player
  attr_reader :name
  attr_accessor :backpack
  
  def initialize(name)
    @name = name
    @backpack = ["item", "item", "item", "item", "item", "item", "item", "item", "item", "item"]
  end

end