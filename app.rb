require_relative './book'
require_relative './student'
require_relative './classroom'
require_relative './teacher'
require_relative './person'

class App
  def initialize
    @books = []
  end


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

# Add a Create Student method
def continue(age, name, parent_permission, classroom_type)
  case parent_permission.upcase
  when 'Y'
    parent_permission = true
  when 'N'
    parent_permission = false
  end

  classroom = Classroom.new(classroom_type)
  person = Person.new(age, name, parent_permission: parent_permission)
  student = Student.new(person, classroom)
  Classroom.students.push(student)
  puts 'Student created successfully'
end

def create_student
  age = nil
  name = nil
  parent_permission = nil
  classroom_type = nil

  loop do
    puts 'Age:'
    age = gets.chomp

    puts 'Name:'
    name = gets.chomp

    puts 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp

    puts 'Classroom type eg. Math class:'
    classroom_type = gets.chomp

    break unless age.empty? || name.empty? || classroom_type.empty? || parent_permission.empty?
  end

  resume(age, name, parent_permission, classroom_type)
end

# Create a teacher Section
def create_teacher
  age = nil
  name = nil
  specialization = nil

  loop do
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp

    break unless age.empty? || name.empty? || specialization.empty?

    puts 'Please enter a valid value for all fields'
  end

  person = Person.new(age, name)
  new_teacher = Teacher.new(person, specialization)
  Teacher.teachers << new_teacher
  puts 'Teacher successfully created'
end

# list all people section...
def get_teachers
  teachers = Teacher.teachers
  puts '' if teachers.empty?
  teachers
end

def get_students
  students = Classroom.students
  puts '' if students.empty?
  students
end

def all_people
  people = []
  all_teachers = get_teachers
  all_students = get_students

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


