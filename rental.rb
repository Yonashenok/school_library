# recored of rented books
class Rental
  attr_reader :person, :book
  attr_accessor :data

  def initialize(data, person, book)
    @data = data

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
