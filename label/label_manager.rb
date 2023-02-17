class LabelManager
  def initialize()
    @labels = []
  end

  def list_all_books
    @labels.each { |label| puts "ID: #{label.id} Title: #{label.title}, Color: #{label.color}" }
  end
end
