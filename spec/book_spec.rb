require 'rspec'
require_relative '../book/book'
describe Book do
  describe '#can_be_archived' do
    it 'should return false if coverstate is not bad' do
      book = Book.new('Yousef', 'good', Time.now)
      expect(book.can_be_archived?).to eq false
    end
    it 'should return true if coverstate is bad' do
      book = Book.new('unkown', 'bad', Time.now)
      expect(book.can_be_archived?).to eq true
    end
  end
end
