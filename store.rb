require 'json'

class Storing

	def stores_data(arr, path)
		if File.exist?(path)
		file = File.read(path)
		data = JSON.parse(file)
		else 
			data = []
		end

		if path == "./data/books.json" 
			arr.each do |book|
				data.push([book.title, book.author])
			end
		elsif path == "./data/persons.json"
      arr.each do |person|
        data.push([person.age, person.name, person.id, person.class.to_s])
      end
		elsif path == "./data/rentals.json"
			arr.each do |rental|
				data.push([rental.date, rental.person, rental.book])
			end
		end

		send = JSON.dump(data)
		if !File.exist?(path)
			File.new(path, "w+")
		end
		File.write(path, data)
	end

end