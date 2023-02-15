require 'json'
require_relative './game'
require_relative '../storage'

class GamesManager
  def initialize
    @storage = Storage.new

    @games = @storage.load_data('games')
  end

  def list_all_games
    puts @games
    puts 'This is all the games we have : '
    @games.each_with_index do |game, index|
      puts "#{index + 1}. multiplayer: #{game.multiplayer} - last_played: #{game.last_played_at}"
    end
    puts ' '
  end

  def add_game
    puts 'Adding new game'
    print 'publish_date yyyy-mm-dd: '
    publish_date = gets.chomp
    print 'multiplayer : '
    multiplayer = gets.chomp
    print 'last_played_date yyyy-mm-dd: '
    last_played_at = gets.chomp

    @games << Game.new(publish_date, multiplayer, last_played_at)
    puts 'game created successfully !!!'

    @storage.save_data('games', @games)
  end
end
