require_relative './app'
require_relative './preserve_data'

class Main
  def initialize
    @app = App.new
  end

  def main
    puts 'Welcome to School Library App!'

    loop do
      puts "\n"
      list_options
      choice = gets.chomp.to_i

      case choice
      when 1..6
        take_action(choice)
        @app.save_data_to_json
      when 7
        @app.save_data_to_json
        puts 'Thank You for using this app!'
        exit 0
      else
        puts 'Invalid option, try again!'
      end
    end
  end

  def list_options
    puts 'Please choose an option:'
    options = [
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person ID',
      '7 - Exit'
    ]
    puts options
  end

  def take_action(choice)
    case choice
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      print 'ID of the person: '
      id = gets.chomp.to_i
      @app.list_rentals(id)
    end
  end
end

main_app = Main.new
main_app.main
