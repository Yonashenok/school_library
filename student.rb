# frozen_string_literal: true

require './person'
# student with there classroom and skills
class Student < Person
  attr_reader :classroom
  attr_accessor :parent_permission

  def initialize(age, parent_permission, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
