require_relative 'book'

class BookManager
  def initialize()
    @books = []
  end

  def list_all_books
    @books.each_with_index { |book, index| puts " #{index + 1}- ID: #{book.id}, Publisher: #{book.publisher}, cover_state: #{book.cover_state}" }
  end

  def add_book()
    puts 'Adding New Book\n'
    puts 'Publisher: '
    publisher = gets.chomp
    puts 'Cover State: '
    cover_state = gets.chomp
    puts 'publish_date yyyy-mm-dd: '
    publish_date = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
  end
end
