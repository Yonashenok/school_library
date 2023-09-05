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
    if person
      puts 'Rentals :'
      person.rentals.each { |rent| puts "Date: #{rent.date}, Book: #{rent.book.title}, by #{rent.book.author}" }
    else
      puts 'Person does not exist'
    end
  end
end

# rubocop:enable Metrics
