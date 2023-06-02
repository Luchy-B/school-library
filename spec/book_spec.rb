require './book'

describe Book do
  book = Book.new('Down the Lane', 'C.T. Rutherford')

  context 'Should create a book object' do
    it 'Should return book title' do
      expect(book.title).to eq('Down the Lane')
    end

    it 'Should return book Author' do
      expect(book.author).to eq('C.T. Rutherford')
    end
  end
end
