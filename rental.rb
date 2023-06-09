class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date
    @book = book
    book['rentals'] << self

    @person = person
    person['rentals'] << self
  end

  def to_h
    {
      date: @date,
      person: @person.to_h,
      book: @book.to_h
    }
  end
end
