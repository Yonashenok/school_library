require './person'

describe Person do
  context 'when testing the Person class' do
    it 'should return all the person created in the array form when call the Person.all method ' do
      # Arrange
      mock_person_age = '23'
      mock_person_name = 'john snow'
      # Act
      Person.new(mock_person_age, mock_person_name)
      person_data = Person.all
      # Assert
      expect(person_data.length).to eq 1
    end

    it 'should return the proper value of the give input' do
      # Arrange
      mock_person_age = '23'
      mock_person_name = 'john snow'
      # Act
      Person.new(mock_person_age, mock_person_name)
      person_data = Person.all
      result = person_data[0].age
      result1 = person_data[0].name
      result2 = person_data[0].id
      # Assert
      expect(result).to eq '23'
      expect(result1).to eq 'john snow'
      expect(result2).to be_between(1, 1000).inclusive
    end
  end
end
