class Item
  attr_reader :label, :author, :source, :genre

  def initialize(publish_date)
    @id = rand(100..1000)
    @publish_date = publish_date
    @archived = false
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.item.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def can_be_archived?()
    Time.now.year - @publish_date.year > 10
  end

  def move_to_archive()
    return unless can_be_archived?

    self.archived = true
  end
end
