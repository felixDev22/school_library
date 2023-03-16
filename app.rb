require_relative './book'

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