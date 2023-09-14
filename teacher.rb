require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :parent_permission

  @@all_teachers = []

  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @@all_teachers << self
  end

  def self.all
    @@all_teachers
  end

  def can_use_services?
    true
  end
end