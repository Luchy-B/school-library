describe '#initialize' do
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
