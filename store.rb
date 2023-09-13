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
      arr.each { |book| data.push([book.title, book.author]) }
    when './data/persons.json'
      arr.each do |person|
        if instance_of?(Teacher)
          data.push([person.age, person.name, person.id, person.specialization, person.class.to_s])
        else
          data.push([person.age, person.name, person.id, person.parent_permission, person.class.to_s])
        end
      end
    when './data/rentals.json'
      arr.each do |rental|
        data.push([rental.date, rental.person, rental.book])
      end
    end

    File.new(path, 'w+') unless File.exist?(path)
    File.write(path, data)
  end
end
