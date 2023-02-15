require 'rspec'
require_relative '../games/game'

describe Game do
  it 'game should be an instance of game class' do
    game = Game.new(Time.new(1998, 11, 23), 'multiplayer', Time.new(2020, 12, 25))

    expect(game).to be_an_instance_of Game
  end

  context 'when published date is older than 10 years and last played at is older than 2 years' do
    it 'returns true' do
      game = Game.new(Time.new(1998, 11, 23), 'multiplayer', Time.new(2020, 12, 25))

      expect(game.can_be_archived?).to eq(true)
    end
  end

  context 'when last played at is within 2 years' do
    it 'returns false' do
      game = Game.new(Time.new(1998, 11, 23), 'multiplayer', Time.new(2022, 2, 14))

      expect(game.can_be_archived?).to eq(false)
    end
  end
end
