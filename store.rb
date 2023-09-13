# frozen_string_literal: true

require 'json'

# Stores data in json files
class Storing
  def stores_data(arr, path)
    if File.exist?(path)
      file = File.read(path)
      data = JSON.parse(file)
    else
      data = []
    end

    case path
    when './data/books.json'
      arr.each do |book|
        data.push([book.title, book.author])
      end
    when './data/persons.json'
      arr.each do |person|
        data.push([person.age, person.name, person.id, person.class.to_s])
      end
    when './data/rentals.json'
      arr.each do |rental|
        data.push([rental.date, rental.person, rental.book])
      end
    end

    send = JSON.dump(data)
    File.new(path, 'w+') unless File.exist?(path)
    File.write(path, data)
  end
end
