require_relative 'book'

class BookManager
  def initialize()
    @storage = Storage.new

    @books = @storage.load_data('books')
  end

  def list_all_books
    @books.each_with_index do |book, index|
      puts " #{index + 1}- ID: #{book.id}, Publisher: #{book.publisher}, cover_state: #{book.cover_state}"
    end
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
    @storage.save_data('books', @books)
  end
end
