require 'json'
require './filechecker'

# Stores data in json files
class Storing
  def stores_data(arr, path)
    if File.exist?(path)
      file = File.read(path)
      data = JSON.parse(file)
    else
      data = []
    end
    File.new(path, 'w+') unless File.exist?(path)
    File.write(path, store_checker(path, arr, data))
  end

  def store_checker(path, arr, data)
    case path
    when './data/books.json'
      data = store_book(arr, data)
    when './data/persons.json'
      data = store_person(arr, data)
    when './data/rentals.json'
      data = store_rental(arr, data)
    end
    data
  end

  def store_book(arr, data)
    arr.each { |book| data.push([book.title, book.author]) }
    data
  end

  def store_person(arr, data)
    arr.each do |person|
      if person.instance_of?(Teacher)
        data.push([person.age, person.specialization, person.id,  person.name, person.class.to_s])
      else
        data.push([person.age, person.name, person.id, person.parent_permission, person.class.to_s])
      end
    end
    data
  end

  def store_rental(arr, data)
    arr.each do |rental|
      data.push([rental.date, rental.person, rental.book])
    end
    data
  end
end
