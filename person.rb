require './nameable'
require './decorator'
require './rental'

# Person class
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  def remove_rental(rental)
    rentals.delete(rental)
    rental.person = nil
  end

  def of_age?
    @age >= 18
  end
  private :of_age?
end


person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalizedperson = CapitalizeDecorator.new(person)
puts capitalizedperson.correct_name

capitalizedtrimmedperson = TrimmerDecorator.new(capitalizedperson)
puts capitalizedtrimmedperson.correct_name
