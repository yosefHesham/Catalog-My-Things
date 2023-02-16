require './games/game'
require './games/game_manager'
require './authors/author_manager'
require './genre'
require './music_album'
require_relative './data/data_storage'

class App
  def initialize
    @games = GamesManager.new
    @authors = AuthorsManager.new
  end

  def process_option(option)
    options = {
      '1' => proc {},
      '2' => proc {@app.list_albums},
      '3' => proc {},
      '4' => proc { @games.list_all_games },
      '5' => proc {@app.list_genres},
      '6' => proc {},
      '7' => proc { @authors.list_all_authors },
      '8' => proc {},
      '9' => proc {},
      '10' => proc {@app.add_album},
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
