require './nameable'

# class person with it own instance variable
class Person < Nameable
  attr_accessor :name, :age

  attr_reader :id

  def initialize(age, name = 'Unkown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end
