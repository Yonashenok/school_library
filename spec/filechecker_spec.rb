require './filechecker'

describe FileChecker do
  describe '.read_json_file' do
    context 'when the file exists' do
      it 'reads and returns the content of the JSON file' do
        # Arrange
        file_path = 'data.json'
        json_content = [{ name: 'John', age: 30 }, { name: 'Jane', age: 25 }]
        allow(File).to receive(:exist?).with(file_path).and_return(true)
        allow(File).to receive(:read).with(file_path).and_return(json_content.to_json)

        # Act
        result = FileChecker.read_json_file(file_path)

        # Assert
        expect(result).to eq(json_content.to_json)
      end
    end

    context 'when the file does not exist' do
      it 'returns an empty array' do
        # Arrange
        file_path = 'nonexistent.json'
        allow(File).to receive(:exist?).with(file_path).and_return(false)

        # Act
        result = FileChecker.read_json_file(file_path)

        # Assert
        expect(result).to eq([])
      end
    end
  end

  describe '.file_exists?' do
    context 'when the file exists' do
      it 'returns true' do
        # Arrange
        file_path = 'data.json'
        allow(File).to receive(:exist?).with(file_path).and_return(true)

        # Act
        result = FileChecker.file_exists?(file_path)

        # Assert
        expect(result).to be true
      end
    end

    context 'when the file does not exist' do
      it 'returns false' do
        # Arrange
        file_path = 'nonexistent.json'
        allow(File).to receive(:exist?).with(file_path).and_return(false)

        # Act
        result = FileChecker.file_exists?(file_path)

        # Assert
        expect(result).to be false
      end
    end
  end
end
