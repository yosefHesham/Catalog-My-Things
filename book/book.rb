require_relative '../item'
class Book < Item
  attr_reader :id, :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?()
    super || @cover_state == 'bad'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'publish_date' => @publish_date
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['publish_date'], object['cover_state'], object['publish_date'])
  end
end
