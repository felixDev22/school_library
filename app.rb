require_relative './book'
require_relative './student'
require_relative './classroom'
require_relative './teacher'
require_relative './person'
require_relative './rental'

def all_book
  booklist = Book.saved_books
  if booklist.empty?
    puts 'No book yet!, please add a book'
  else
    booklist.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end
end

def create_book
  puts 'Title:'
  title = gets.chomp
  puts 'Author:'
  author = gets.chomp
  book = Book.new(title, author)
  Book.saved_books.push(book)
  puts 'Book created successfully'
end

def create_student
  puts 'create a new student'
  puts 'Age:'
  age = gets.chomp.to_i
  puts 'Name:'
  name = gets.chomp
  puts 'Has parent permission? [Y/N]:'
  parent_permission = gets.chomp.downcase
  case parent_permission
  when 'y'
    student = Student.new(classroom: @classroom, age:, name:, parent_permission: true)
    @people << student
    puts 'Student created successfully'
  when 'n'
    student = Student.new(classroom: @classroom, age:, name:, parent_permission: false)
    @people << student
    puts 'Student created successfully'
  else
    puts 'Invalid option'
    nil
  end
end

def create_teacher
  name = ''
  loop do
    puts 'Enter teacher name:'
    name = gets.chomp
    break unless name.empty?

    puts 'Please enter a valid name'
  end

  specialty = ''
  loop do
    puts 'Enter teacher specialty:'
    specialty = gets.chomp
    break unless specialty.empty?

    puts 'Please enter a valid specialty'
  end
  puts 'Teacher created successfully'
end

# List all people section
def retrieve_teachers
  teachers = Teacher.teachers
  puts '' if teachers.empty?
  teachers
end

def retrieve_students
  students = Classroom.students
  puts '' if students.empty?
  students
end

def all_people
  people = []
  all_teachers = retrieve_teachers
  all_students = retrieve_students

  all_teachers.each do |teacher|
    teacher_str = "[Teacher] Name: #{teacher.name}, Age: #{teacher.age}, Id: #{teacher.id}"
    people << { str: teacher_str, obj: teacher }
  end

  all_students.each do |student|
    student_str = "[Student] Name: #{student.name}, Age: #{student.age}, Id: #{student.id}"
    people << { str: student_str, obj: student }
  end

  if people.empty?
    puts 'Empty: Please create a person.'
  else
    people.each do |human|
      puts human[:str]
    end
  end
  people
end

def add_rentee(book_list, persons, book_num)
  rented_book = book_list[book_num]

  puts 'Select a person from the following list by number (not id)'
  persons.each_with_index do |person, index|
    puts "#{index}) #{person[:str]}"
  end

  rentee = gets.chomp.to_i
  receiver = persons[rentee][:obj]

  puts 'Date:'
  date_rented = gets.chomp
  receiver.add_rental(rented_book, date_rented)

  puts 'Rental created successfully'
end

# create rental section...
def create_rental
  book_list = Book.saved_books
  persons = all_people
  if book_list.empty?
    puts 'No books! please add a book'
  elsif persons.empty?
    puts 'please go back and create a person to rent the book'
  else
    puts 'Select a book from the following list by number'

    book_list.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_num = gets.chomp.to_i

  end
  add_rentee(book_list, persons, book_num)
end

def user_rentals
  puts 'ID of person:'
  id = gets.chomp.to_i

  # Find all rentals for the person with the given ID
  rentals = Person.all_rentals.select { |rental| rental.person.id == id }

  if rentals.empty?
    puts "No rentals found for person with ID #{id}."
  else
    # Print details of each rental
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
