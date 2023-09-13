# frozen_string_literal: true

require './person'
# teacher with there specialization and servies
class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def can_use_services?
    true
  end
end
