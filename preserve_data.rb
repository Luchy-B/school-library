require 'json'

DATA_DIR = 'data'.freeze

def save_books_to_json
  books_data = @books.map { |book| { 'title' => book.title, 'author' => book.author } }
  File.write("#{DATA_DIR}/books.json", JSON.pretty_generate(books_data))
end

def save_people_to_json
  people_data = @peoples.map do |person|
    {
      'type' => person.class.name,
      'id' => person.id, # Include the person ID
      'age' => person.age,
      'name' => person.name,
      'parent_permission' => person.is_a?(Student) ? person.parent_permission : nil,
      'specialization' => person.is_a?(Teacher) ? person.specialization : nil
    }
  end

  File.write("#{DATA_DIR}/people.json", JSON.pretty_generate(people_data))
end

def load_data_from_json
  load_books_from_json
  load_people_from_json
  load_rentals_from_json

  puts 'Data loaded successfully.'
end

def load_books_from_json
  return unless File.exist?("#{DATA_DIR}/books.json")

  books_json = File.read("#{DATA_DIR}/books.json")
  books_data = JSON.parse(books_json)
  @books = books_data.map { |book_data| Book.new(book_data['title'], book_data['author']) }
end

def load_people_from_json
  return unless File.exist?("#{DATA_DIR}/people.json")

  people_json = File.read("#{DATA_DIR}/people.json")
  people_data = JSON.parse(people_json)

  people_data.each do |person_data|
    if person_data['type'] == 'Student'
      student = Student.new(person_data['age'], person_data['name'],
                            parent_permission: person_data['parent_permission'])
      student.id = person_data['id'] # Assign the person ID
      @peoples << student
    elsif person_data['type'] == 'Teacher'
      teacher = Teacher.new(person_data['age'], person_data['specialization'], person_data['name'])
      teacher.id = person_data['id'] # Assign the person ID
      @peoples << teacher
    end
  end
end
