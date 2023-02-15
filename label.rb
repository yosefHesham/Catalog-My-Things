class Label
  attr_accessor :color, :title
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand(0...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item
  end
end
