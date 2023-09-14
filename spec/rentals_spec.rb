require './rental'

describe Rental do
  context 'when testing the Rental class' do
    it 'should return all the rental created in the array form when call the Rental.all method ' do
      # Arrange
      mock_rented_date = '2023/09/08',
                         mock_rented_person = ['12', 'tomas', 999, 'Student'],
                         mock_rented_book = ['game of throns', 'john snow']
      # Act
      Rental.new(mock_rented_date, mock_rented_book, mock_rented_person)
      rental_data = Rental.all
      # Assert
      expect(rental_data.length).to eq 1
    end

    it 'should return the proper value of the give input' do
      # Arrange
      mock_rented_date = '2023/09/08',
                         mock_rented_person = ['12', 'tomas', 999, 'Student'],
                         mock_rented_book = ['game of throns', 'john snow']
      # Act
      Rental.new(mock_rented_date, mock_rented_book, mock_rented_person)
      rental_data = Rental.all
      result = rental_data[0].date[0]
      result1 = rental_data[0].person[1]
      result2 = rental_data[0].person[2]
      result3 = rental_data[0].book[0]
      # Assert
      expect(result).to eq '2023/09/08'
      expect(result1).to eq 'tomas'
      expect(result2).to be_between(1, 1000).inclusive
      expect(result3).to eq 'game of throns'
    end
  end
end
