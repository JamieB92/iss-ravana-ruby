class Room
  attr_reader :name, :exits
  attr_accessor :item
    
  def initialize(name, exits, item)
    @name = name
    @exits = exits
    @item = item
  end
end
