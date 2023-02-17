require_relative './author'

class AuthorsManager
  def initialize
    @authors = []
    authors = [Author.new('John', 'Doe'), Author.new('Jane', 'Doe')]
    authors.each { |author| @authors.push(author) }
  end

  def list_all_authors
    puts ''
    if @authors.empty?
      puts 'No authors recorded yet.'
      return
    end
    puts 'Authors List :'
    puts ''
    @authors.each { |author| puts "ID: #{author.id} FirstName: #{author.fisrt_name}, LastName: #{author.last_name}" }
    puts ''
  end
end
