class Alien
  attr_reader :name, :items_required, :description
  attr_accessor :health

  def initialize(name, items_required, description)
    @name = name
    @items_required = items_required
    @description = description
  end

end