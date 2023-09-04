# person property and permission with parents
class Person
  attr_accessor :name, :age

  attr_reader :id

  def initialize(age, name = 'Unkown', parent_permission: true)
    @id = Random.rand(1..1000)

    @name = name

    @age = age

    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if @parent_permission || of_age?

    false
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
