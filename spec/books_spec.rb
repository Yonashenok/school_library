require './book'

describe Book do 

	context "when testing the Book class" do

		it "should return all the book created in the array form when call the Book.all method " do
			#Arrange
			mock_book_title = 'Game of thrones'
			mock_book_author = 'john snow'
			mock_book_title_1 = 'Harry Potter'
			mock_book_author_1 = 'Someone'
			#Act
			book = Book.new(mock_book_title, mock_book_author)
			book2 = Book.new(mock_book_title_1,mock_book_author_1)
			book_data = Book.all
			#Assert
			expect(book_data.length).to  eq 2
		end

		it "should return the proper value of the give input" do
			#Arrange
			mock_book_title = 'Game of thrones'
			mock_book_author = 'john snow'
			mock_book_title_1 = 'Harry Potter'
			mock_book_author_1 = 'Someone'
			#Act
			book = Book.new(mock_book_title, mock_book_author)
			book2 = Book.new(mock_book_title_1,mock_book_author_1)
			book_data = Book.all
			result = book_data[0].title
			result1 = book_data[1].title
			#Assert
			expect(result).to  eq 'Harry Potter'
			expect(result1).to  eq 'Game of thrones'
		end
  end    
end