require 'pry'
require './app'

# rubocop:disable Metrics
def switch_case(number)
  app = App.new
  case number
  when '1'
    puts ''
    45.times { print '='}
    puts ''
    app.list_of_book
    45.times { print '='}
    puts ''
    
  when '2'
    puts ''
    45.times { print '='}
    puts ''
    app.list_of_person
    45.times { print '='}
    puts ''
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
    puts ''
    45.times { print '='}
    puts ''
    app.rented_books
    45.times { print '='}
    puts ''
  else
    puts puts 'wrong choose of number please select the right number from the list'
  end
end

def main
  puts 'Welcome to School Library App!'

  loop do
    puts ''
    45.times { print '=' }
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
