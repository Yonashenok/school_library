require './classroom'
describe Classroom do
  context 'when testing the Classroom class' do
    it 'should add student to classroom when call the add_students method' do
      # Arrange
      mock_student = ['12', 'tomas', 999, 'Student'],
                     mock_label = 'biology'
      # Act
      classroom = Classroom.new(mock_label)
      classroom.add_students(mock_student)
      # Assert
      expect(classroom.students[0].length).to eq 2
      expect(classroom.label).to eq 'biology'
    end
  end
end
