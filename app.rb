require 'json'
require './student'
require './teacher'
require './book'
require './rental'
require './store'
require 'pry'


# start the library console
class App
  def list_of_book
    if File.exist?("./data/books.json")
      file = File.read("./data/books.json")
      data_books = JSON.parse(file)
      else 
        data_books = []
      end
      data_books.map.with_index { |book, index| puts "(#{index + 1}) Title: #{book[0]} , Author: #{book[1]}" }
  end

  def list_of_person
    if File.exist?("./data/persons.json")
      file = File.read("./data/persons.json")
      data_persons = JSON.parse(file)
      else 
        data_persons = []
      end
      data_persons.map.with_index do |person, index|
      puts "(#{index + 1})[#{person[3]}] Name:#{person[1]}, ID:#{person[2]}, Age: #{person[0]}"
    end
  end

  # rubocop:disable Metrics
  def creat_person(number)
    if number == '1'
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
      data = Person.all
      save = Storing.new()
      save.stores_data([data[0]], "./data/persons.json")
      puts 'Person created succesfully'
    elsif number == '2'
      puts 'creating teacher profil'
      print 'Age :'
      age = gets.chomp
      print 'Name :'
      name = gets.chomp
      print 'Specialization :'
      spicality = gets.chomp
      Teacher.new(spicality, age, name)
      data = Person.all
      save = Storing.new()
      save.stores_data([data[0]], "./data/persons.json" )
      puts 'Person created succesfully'
    else
      puts 'you have inserted wrong option'

    end
  end

  def creat_book
    print 'Title :'
    title = gets.chomp
    print 'Author :'
    author = gets.chomp
    Book.new(title, author)
    data = Book.all
    save = Storing.new()
    save.stores_data([data[0]], "./data/books.json")
    puts 'Book created succesfully'
  end

  def rent_book
    list_of_book
    selected = gets.chomp.to_i
    if File.exist?("./data/books.json")
      file = File.read("./data/books.json")
      data_books = JSON.parse(file)
    end
    selected_book =  data_books[selected - 1]
    puts 'Select a person from the following list by number'
    list_of_person
    picked = gets.chomp.to_i
    if File.exist?("./data/persons.json")
      file = File.read("./data/persons.json")
      data_persons = JSON.parse(file)
    end
    selected_person =  data_persons[picked - 1]
    print 'Date :'
    date = gets.chomp
    Rental.new(date, selected_book, selected_person)
    data = Rental.all
    save = Storing.new()
    save.stores_data([data[0]], "./data/rentals.json")
  end

  def rented_books
    print 'ID of person: '
    id = gets.chomp
    if File.exist?("./data/rentals.json")
      file = File.read("./data/rentals.json")
      data_rentals = JSON.parse(file)
    end
    data_rented=  data_rentals.select { |p| p[1][2] == id.to_i }
    if data_rented
      puts 'Rentals :'
      data_rented.each { |rent| puts "Date: #{rent[0]}, Book: #{rent[2][0]}, by #{rent[2][1]}" }
    else
      puts 'Person does not exist'
    end
  end
end

# rubocop:enable Metrics
