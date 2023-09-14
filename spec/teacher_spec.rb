require './teacher'

describe Teacher do
  let(:specialization) { 'Mathematics' }
  let(:age) { 35 }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }
  let(:teacher) { Teacher.new(specialization, age, name, parent_permission: parent_permission) }

  before do
    Teacher.class_variable_set(:@@all_teachers, []) # Reset the @@all_teachers array before each test
  end

  describe '#initialize' do
    it 'sets the specialization, age, name, and parent_permission correctly' do
      expect(teacher.specialization).to eq(specialization)
      expect(teacher.age).to eq(age)
      expect(teacher.name).to eq(name)
      expect(teacher.parent_permission).to eq(parent_permission)
    end
  end

end