# frozen_string_literal: true

# student with there classroom and skills
class Student < Person
  def initialize(class_room)
    super()
    @class_room = class_room
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
