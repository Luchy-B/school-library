class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @date = date
    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end

  def book=(book)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    person.rentals.push(self) unless book.rentals.include?(self)
  end
end
