class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    rental = { date: date, book: to_h, person: person.to_h }
    rentals << rental
  end

  def to_h
    { title: title, author: author, rentals: rentals }
  end
end
