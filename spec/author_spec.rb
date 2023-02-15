require 'rspec'
require_relative '../author/author'
require_relative '../games/game'

RSpec.describe Author do
  describe '#add_item' do
    it 'adds the item to the collection of items and sets the author property of the item' do
      author = Author.new('Shigeru', 'Miyamoto')
      game = Game.new(Time.new(1998, 11, 23), 'multiplayer', Time.new(2022, 2, 14))
      game.author = nil

      author.add_item(game)

      expect(author.items.length).to eq(1)
      expect(game.author).to eq(author)
    end
  end
end
