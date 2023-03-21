require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'
require_relative 'options'
require_relative 'preserve_data'
require_relative 'create_student'
require_relative 'create_teacher'
require_relative 'list_rentals'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    @book = load_data('books.json')
    if @book.empty?
      puts 'Please add a book to the library'
    else
      data = @book.map(&:to_h)
      data.each do |book|
        puts "Title: #{book['title']}, Author: #{book['author']}"
      end
    end
  end

  def list_all_persons
    if @people.empty?
      puts 'Please add a person to the library'
    else
      data = @people.map(&:to_h)
      data.each do |person|
        puts "[#{person.class.name}] Name: #{person[:name]}, ID: #{person[:id]}, Age: #{person[:age]}"
      end
    end
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
    save_data(@books, 'books.json')
    puts "Book #{title} created successfully."
  end

  def create_rental
    puts 'Select a book from the list'
    @book = load_data('books.json')
    @book.each_with_index do |book, index|
      puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
    end
    rental_book = gets.chomp.to_i

    puts 'Select a person from list'
    @people = load_data('people.json')
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    rental_person = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @book[rental_book], @people[rental_person])
    @rentals.push(rental)
    save_data(@rentals, 'rental.json')
    puts 'Rental created successfully'
  end

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
end
