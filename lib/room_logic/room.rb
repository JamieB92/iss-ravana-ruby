class Room
  attr_reader :name, :exits, :description
  attr_accessor :item
    
  def initialize(name, description, exits, item)
    @name = name
    @description = description
    @exits = exits
    @item = item
  end
end
