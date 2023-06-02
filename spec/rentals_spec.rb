# rentals_specs.rb
require './rental'
require './book'
require './person'

describe '#initialize' do
  person = Person.new('John', 16)
  book = Book.new('Harry Potter', 'J. K. Rowling')
  rental = Rental.new('2023-06-02', person, book)
  date = Time.now.strftime('%Y-%m-%d')
  
  it 'sets the date of the rental' do
    expect(rental.date).to eq(date)
  end

  it 'associates the rental with the person' do
    expect(rental.person).to eq(person)
    expect(person.rentals).to include(rental)
  end

  it 'associates the rental with the book' do
    expect(rental.book).to eq(book)
    expect(book.rentals).to include(rental)
  end
end