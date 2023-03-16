require_relative './book'


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