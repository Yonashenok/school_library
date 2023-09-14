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

  describe '#initialize' do
    it 'sets the age, parent_permission, name, and classroom correctly' do
      expect(student.age).to eq(age)
      expect(student.parent_permission).to eq(parent_permission)
      expect(student.name).to eq(name)
      expect(student.classroom).to be_nil
    end
  end

  describe '#classroom=' do
    it 'assigns the student to the specified classroom' do
      classroom = Classroom.new('Math')
      student.classroom = classroom

      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to contain_exactly(student)
    end

    it 'does not assign the student to the same classroom multiple times' do
      classroom = Classroom.new('Math')
      student.classroom = classroom
      student.classroom = classroom

      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to contain_exactly(student)
    end
  end

end