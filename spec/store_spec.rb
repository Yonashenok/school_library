require 'rspec'
require './store'
require './filechecker'
require './person'
require './student'
require './teacher'
require './book'
require './rental'

describe Storing do
  let(:storing) { Storing.new }
  let(:books_data_path) { './data/books.json' }
  let(:persons_data_path) { './data/persons.json' }
  let(:rentals_data_path) { './data/rentals.json' }

  before do
    # Make sure the data files are empty before each test
    File.write(books_data_path, '[]')
    File.write(persons_data_path, '[]')
    File.write(rentals_data_path, '[]')
  end

  describe '#stores_data' do
    context 'when storing book data' do
      it 'stores book data in the JSON file' do
        books = [Book.new('Book 1', 'Author 1'), Book.new('Book 2', 'Author 2')]
        storing.stores_data(books, books_data_path)

        # Read the data from the file
        stored_data = JSON.parse(File.read(books_data_path))
        expect(stored_data).to eq([
          ['Book 1', 'Author 1'],
          ['Book 2', 'Author 2']
        ])
      end
    end
  end
end