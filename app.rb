require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './person'
require_relative './classroom'
require_relative './preserve_data'
require 'fileutils'

class App
  attr_accessor :books, :peoples, :rentals

  def initialize
    @books = []
    @peoples = []
    @rentals = []
    load_data_from_json
  end

  def list_books
    if @books.empty?
      puts 'There are no books'
    else
      puts 'List of Books:'
      @books.each do |book|
        puts "Title: #{book.title} Author: #{book.author}"
      end
    end
  end

  def list_people
    if @peoples.empty?
      puts 'There are no people available'
    else
      puts 'List of People:'
      @peoples.each do |person|
        puts "ID: #{person.id}, Name: #{person.correct_name}, Age: #{person.age}"
      end
    end
  end

  def create_student
    puts 'Enter Student Age'
    age = gets.chomp.to_i
    puts 'Enter Student Name'
    name = gets.chomp
    puts 'Does the student have parent permission? (true/false)'
    parent_permission = gets.chomp.downcase == 'true'
    puts 'Enter Student Classroom'
    classroom = gets.chomp
    student = Student.new(classroom, age, name, parent_permission: parent_permission)
    @peoples << student
  end

  def create_teacher
    puts 'Enter Teacher Age'
    age = gets.chomp.to_i
    puts 'Enter Teacher Name'
    name = gets.chomp
    puts 'Does the teacher have parent permission? (true/false)'
    parent_permission = gets.chomp.downcase == 'true'
    puts 'Enter Teacher Specialization'
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name, parent_permission: parent_permission)
    @peoples << teacher
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input number]:'
    person_type = gets.chomp.to_i

    case person_type
    when 1
      create_student
      puts 'The Student created successfully'
    when 2
      create_teacher
      puts 'The Teacher created successfully'
    else
      puts 'Invalid person type, please choose either student (1) or teacher (2).'
    end
  end

  def create_book
    puts 'Enter Book Title'
    title = gets.chomp
    puts 'Enter Book Author'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "The Book #{book.title} created successfully"
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each.with_index { |book, idx| puts "#{idx}) Book #{book.title} by #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number(not ID)'
    @peoples.each.with_index do |person, idx|
      puts "#{idx}) [#{person.class.name}] Name #{person.name}, ID #{person.id}, Age #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date [YYYY/MM/DD]: '
    date = gets.chomp
    rentals << Rental.new(date, @peoples[person_index], @books[book_index])
    puts 'Rentals created successfuly'
  end

  def list_rentals(id)
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    end
  end

  def save_data_to_json
    FileUtils.mkdir_p(DATA_DIR)

    save_books_to_json
    save_people_to_json
    save_rentals_to_json

    puts 'Data saved successfully.'
  end
end
