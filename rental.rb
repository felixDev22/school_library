class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person
    person.rentals << self
    book.rentals << self
  end

  def to_h
    {
      date: @date,
      person: @person.to_h,
      book: @book.to_h
    }
  end
end
