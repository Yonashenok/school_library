require './person'

# student with there classroom and skills
class Student < Person
  attr_reader :classroom
  attr_accessor :parent_permission

  @@all_students = []

  def initialize(age, parent_permission, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = nil
    @@all_students << self
  end

  def self.all
    @@all_students
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
