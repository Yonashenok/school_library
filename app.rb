# frozen_string_literal: true

require './student'
require './teacher'
require './book'
require './rental'



# start the library console
class App
  def list_of_book
    Book.all.map.with_index { |book, index| puts "(#{index + 1}) Title: #{book.title} , Author: #{book.author}" }
  end

  def list_of_person
    Person.all.map do |person|
      puts "[#{person.class}] Name:#{person.name}, ID:#{person.id}, Age: #{person.age}"
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
    puts 'Book created succesfully'
  end

  def rent_book
    list_of_book
    selected = gets.chomp.to_i
    selected_book = Book.all[selected - 1]
    puts 'Select a person from the following list by number'
    Person.all.map.with_index do |person, index|
      puts "(#{index + 1}) [#{person.class}] Name:#{person.name}, ID:#{person.id}, Age: #{person.age}"
    end
    picked = gets.chomp.to_i
    selected_person = Person.all[picked - 1]
    print 'Date :'
    date = gets.chomp
    Rental.new(date, selected_book, selected_person)
  end

  def rented_books
    print 'ID of person: '
    id = gets.chomp
    person = Person.all.select { |p| p.id == id.to_i }[0]
    if perso
      puts 'Rentals :'
      person.rentals.each { |rent| puts "Date: #{rent.date}, Book: #{rent.book.title}, by #{rent.book.author}" }
    else
      puts 'Person does not exist'
    end
  end
end

def switch_case(number)
  app = App.new
  case number
  when '1'
    app.list_of_book
  when '2'
    app.list_of_person
  when '3'
    puts 'Do you went to create a student (1) or a teacher (2)? [Input the number]:'
    person_choose = gets.chomp
    app.creat_person(person_choose)
  when '4'
    app.creat_book
  when '5'
    puts 'Select a book from the following list by number'
    app.rent_book
    puts 'Rental created succesfully'
  when '6'
    app.rented_books
  else
    puts puts 'wrong choose of number please select the right number from the list'
  end
end

def main
  puts 'Welcome to School Library App!'

  loop do
    puts ''
    puts 'Please choose an option by enterin a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals For  a given person id'
    puts '7 - Exit'
    number = gets.chomp

    break if number == '7'

    switch_case(number)
  end

  puts 'Thank you of using this App'
end
# rubocop:enable Metrics
main
