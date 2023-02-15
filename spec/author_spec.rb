require 'rspec'
require_relative '../authors/author'
require_relative '../games/game'

RSpec.describe Author do
  describe '#add_item' do
    it 'adds the item to the collection of items and sets the author property of the item' do
      author = Author.new('J.K.', 'Rowling')
      game = Game.new(Time.new(2002, 11, 15), 'Harry Potter and the Chamber of Secrets', Time.new(2022, 11, 15))
      author.add_item(game)

      expect(author.items).to eq([game])
      expect(game.author).to eq(author)
    end
  end
end
