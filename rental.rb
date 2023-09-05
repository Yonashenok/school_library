# recored of rented books
class Rental
  attr_accessor :data, :person, :book

  def initialize(data, book, person)
    @data = data

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
