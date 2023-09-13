require 'json'
require './student'
require './teacher'
require './book'
require './rental'
require './store'
require 'pry'
require './filechecker'

# Starts the app
class App
  def list_of_book
    data_books = JSON.parse(FileChecker.read_json_file('./data/books.json'))
    data_books.map.with_index { |book, index| puts "(#{index + 1}) Title: #{book[0]} , Author: #{book[1]}" }
  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  def list_of_person
    data_persons = JSON.parse(FileChecker.read_json_file('./data/persons.json'))
    data_persons.map.with_index do |person, index|
      puts "(#{index + 1})[#{person[4]}] Name:#{person[3]}, ID:#{person[2]}, Age: #{person[0]}"
    end
  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  def creat_person(number)
    case number
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'you have inserted the wrong option'
    end
  end

  def create_student
    puts 'creating student profil'
    print 'Age :'
    age = gets.chomp
    print 'Name :'
    name = gets.chomp
    print 'Has parent permission?[Y/N]'
    permit = gets.chomp.downcase
    parental_permit = true if permit == 'y'
    parental_permit = false if permit == 'n'
    Student.new(age, name, parental_permit)
    data = Student.all
    save = Storing.new
    save.stores_data([data[0]], './data/persons.json')
    puts 'Person created successfully'
  end

  def create_teacher
    puts 'creating teacher profile'
    print 'Age :'
    age = gets.chomp
    print 'Name :'
    name = gets.chomp
    print 'Specialization :'
    spicality = gets.chomp
    Teacher.new(spicality, age, name)
    data = Teacher.all
    save = Storing.new
    save.stores_data([data[0]], './data/persons.json')
    puts 'Person created successfully'
  end

  def create_book
    print 'Title :'
    title = gets.chomp
    print 'Author :'
    author = gets.chomp
    Book.new(title, author)
    data = Book.all
    save = Storing.new
    save.stores_data([data[0]], './data/books.json')
    puts 'Book created successfully'
  end

  def rent_book
    list_of_book
    selected = gets.chomp.to_i
    data_books = JSON.parse(FileChecker.read_json_file('./data/books.json'))
    selected_book = data_books[selected - 1]
    puts 'Select a person from the following list by number'
    list_of_person
    picked = gets.chomp.to_i
    data_persons = JSON.parse(FileChecker.read_json_file('./data/persons.json'))
    selected_person = data_persons[picked - 1]
    print 'Date :'
    date = gets.chomp
    Rental.new(date, selected_book, selected_person)
    data = Rental.all
    save = Storing.new
    save.stores_data([data[0]], './data/rentals.json')
  end

  def rented_books
    print 'ID of person: '
    id = gets.chomp
    data_rentals = JSON.parse(FileChecker.read_json_file('./data/rentals.json'))
    data_rented = data_rentals.select { |p| p[1][2] == id.to_i }
    if data_rented
      puts 'Rentals :'
      data_rented.each { |rent| puts "Date: #{rent[0]}, Book: #{rent[2][0]}, by #{rent[2][1]}" }
    else
      puts 'Person does not exist'
    end
  end
end
