class Room
  attr_reader :name, :exits
  attr_accessor :item, :alien
    
  def initialize(name, exits, item, alien)
    @name = name
    @exits = exits
    @item = item
    @alien = alien
  end
end
