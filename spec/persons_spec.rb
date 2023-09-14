require './person'

describe Person do
  context 'when testing the Person class' do
    before do
      Person.class_variable_set(:@@all_persons, []) # Reset the @@all_persons array before each test
    end

    it 'should return all the persons created in an array form when calling the Person.all method' do
      # Arrange
      mock_person_age = '23'
      mock_person_name = 'John Snow'
      # Act
      Person.new(mock_person_age, mock_person_name)
      person_data = Person.all
      # Assert
      expect(person_data.length).to eq(1)
      expect(person_data[0]).to be_an_instance_of(Person)
      expect(person_data[0].age).to eq(mock_person_age)
      expect(person_data[0].name).to eq(mock_person_name)
    end

    it 'should return the proper value for the given input' do
      # Arrange
      mock_person_age = '23'
      mock_person_name = 'John Snow'
      # Act
      person = Person.new(mock_person_age, mock_person_name)
      person_data = Person.all
      result_age = person_data[0].age
      result_name = person_data[0].name
      result_id = person_data[0].id
      # Assert
      expect(result_age).to eq(mock_person_age)
      expect(result_name).to eq(mock_person_name)
      expect(result_id).to eq(person.id)
    end
  end
end