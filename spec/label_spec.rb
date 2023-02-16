require 'rspec'
require_relative '../label/label'
require_relative '../book/book'

describe Label do
  describe '#Label Class' do
    it 'item should be added in the items array' do
      book = Book.new('Yousef', 'good', Time.now)
      label = Label.new('The Lord Of The Rings', 'Black')
      label.add_item(book)
      expect(label.items).to eq([book])
      expect(book.label).to eq(label)
    end
  end
end
