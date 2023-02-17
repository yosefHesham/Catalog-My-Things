class Author
  attr_accessor :id, :fisrt_name, :last_name, :items

  def initialize(fisrt_name, last_name)
    @id = rand(1..1000)
    @fisrt_name = fisrt_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
