require './person'
require './trimmer_decorator'
require './capitalize_decorator'
require './book'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @people = []
    @books = []
  end

  def list_books
    @books.each do |book|
      puts "#{book.title} by #{book.author} on #{book.rentals.count} rentals"
    end
  end

  def list_people
    @people.each do |person|
      puts "#{person.name} - #{person.class} - #{person.id}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? '
    person_type = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    print 'Age:'
    age = gets.chomp.to_i
    if person_type == 1
      print 'Whats the parent permission? (y/n) '
      parent_permission = gets.chomp == 'y'
      @people << Student.new(name, age, parent_permission)
      puts 'Student created!'
    elsif person_type == 2
      print 'Specialization:'
      specialization = gets.chomp
      @people << Teacher.new(name, age, specialization)
      puts 'Teacher created!'
    else
      puts 'Person not created!'
    end
  end

  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created!'
  end

  def create_rental
    puts 'Choose a book from the list by number'
    @books.each_with_index do |book, index|
      puts "#{index} - #{book.title} by #{book.author}"
    end
    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts 'Choose a person from the list by number:'
    @people.each_with_index do |person, index|
      puts "#{index} - #{person.name} - #{person.age} - #{person.class}"
    end
    person_index = gets.chomp.to_i
    person = @people[person_index]
    puts 'Date: '
    date = gets.chomp
    Rental.new(date, book, person)
    puts 'Rental created!'
  end

  def list_rentals
    puts 'Choose a person from the list by number'
    @people.each_with_index do |person, index|
      puts "#{index} - #{person.name}"
    end
    person_index = gets.chomp.to_i
    person = @people[person_index]
    person.rentals.each do |rental|
      puts "Book: #{rental.book.title} - Date: #{rental.date}"
    end
  end
end
