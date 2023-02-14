class Main
  def run
    options = {
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List all movies',
      '4' => 'List of games',
      '5' => 'List all genres',
      '6' => 'List all labels',
      '7' => 'List all authors',
      '8' => 'List all sources',
      '9' => 'Add a book',
      '10' => 'Add a music album',
      '11' => 'Add a movie',
      '12' => 'Add a game',
      '13' => 'exit'
    }

    puts ' '
    puts 'Please select one of the following options:'
    options.each { |key, value| puts "#{key} - #{value.to_s.capitalize.tr('_', ' ')}" }

    option = gets.chomp

    process_options(option)
  end

  def process_options(option)
    exit if option == '13'

    if options.key?(option)
    # call method
    else
      puts 'Invalid option, please try again.'
    end
  end
end

main = Main.new

main.run
