# recored of rented books
class Rental
  attr_accessor :data, :person, :book

  def initialize(date, book, person)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
