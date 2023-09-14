require './person'
require './student'
require './classroom'

describe Student do
  let(:age) { 15 }
  let(:parent_permission) { true }
  let(:name) { 'John Doe' }
  let(:student) { Student.new(age, parent_permission, name) }

  before do
    Student.class_variable_set(:@@all_students, []) # Reset the @@all_students array before each test
  end

end