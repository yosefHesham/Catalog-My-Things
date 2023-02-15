class AuthorsManager
  def initialize
    @authors = []
  end

  def list_all_authors
    @authors.each { |author| puts "ID: #{author.id} FirstName: #{author.fisrt_name}, LastName: #{author.last_name}" }
  end
end
