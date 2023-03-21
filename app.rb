require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'
require_relative 'options'
require_relative 'list_rentals'
require_relative 'create_student'
require_relative 'create_teacher'
require_relative 'preserve_data'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts 'Please add a book to the library' if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_persons
    puts 'Please add a person to the library' if @people.empty?
    @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
      nil
    end
  end

  def create_book
    puts 'create a new book'

    title = nil
    until title && !title.empty?
      puts 'Title:'
      title = gets.chomp.strip
    end

    author = nil
    until author && !author.empty?
      puts 'Author:'
      author = gets.chomp.strip
    end

    book = Book.new(title, author)
    @books << book
    puts "Book #{title} created successfully."
  end

  def create_rental
    book = select_book
    person = select_person
    date = select_date
    return unless book && person && date

    rental = Rental.new(date, person, book)
    @rentals << rental
    puts 'Rental created successfully'
  end

  private

  def select_book
    puts 'select the book you want to rent by entering its number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_id = gets.chomp.to_i
    return nil unless (0...@books.length).include?(book_id)

    @books[book_id]
  end

  def select_person
    available_people = @people.select(&:can_use_services?)
    puts 'select a person from the list by entering their number'
    available_people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i
    return nil unless (0...available_people.length).include?(person_id)

    available_people[person_id]
  end

  def select_date
    print 'Date: '
    gets.chomp.to_s
  end

  def list_rentals
    puts 'Enter the ID of the person:'
    id = gets.chomp.to_i
    person = @people.find { |p| p.id == id }
    if person.nil?
      puts 'No person found with that ID'
      return
    end

    rentals = @rentals.select { |rental| rental.person == person }
    if rentals.empty?
      puts 'No rentals found for that person'
      return
    end

    puts "Rentals for #{person.name}:"
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
