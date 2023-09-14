require './nameable'

# Class Person with its own instance variables
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  @@all_persons = []

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @@all_persons << self
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def correct_name
    @name
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def self.all
    @@all_persons
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(1..1000)
  end
end