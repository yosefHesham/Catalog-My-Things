require './games/game'
require './games/game_manager'
require './authors/author_manager'
require './music/genre'
require './music/music_album'
require_relative './storage'
require './book/book_manager'

class App
  def initialize
    @games = GamesManager.new
    @authors = AuthorsManager.new
    @storage = Storage.new
    @books = BookManager.new
  end

  def process_option(option)
    options = {
      '1' => proc { @books.list_all_books },
      '2' => proc { @storage.list_albums },
      '3' => proc {},
      '4' => proc { @games.list_all_games },
      '5' => proc { @storage.list_genres },
      '6' => proc {},
      '7' => proc { @authors.list_all_authors },
      '8' => proc {},
      '9' => proc { @books.add_book },
      '10' => proc { @storage.add_album },
      '11' => proc {},
      '12' => proc { @games.add_game },
      '13' => proc { exit }
    }

    if options.key?(option)
      options[option].call
    else
      puts 'Invalid option, please try again.'
    end
  end
end
