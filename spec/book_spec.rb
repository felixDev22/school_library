require 'spec_helper'

describe Book do
  it 'should create instance of the book class with 2 parameters' do
    book = Book.new('Title', 'Author')
    expect(book).to be_an_instance_of Book
  end
end

# Test for title
describe '#title' do
  it 'should return the title' do
    book = Book.new('title-SIMBA', 'LION')
    expect(book.title).to eq('title-SIMBA')
  end
end

# Test for author
describe '#author' do
  it 'should return the author' do
    book = Book.new('SIMBA', 'Author-LION')
    expect(book.author).to eq('Author-LION')
  end
end

# Test for add_rental
describe '#add_rental' do
  it 'should add the rental to the rentals array' do
    book = Book.new('Hakuna Matata', 'Safari Kenya')
    person = Person.new(name: 'Peter Kings', age: 27, parent_permission: true)
    rental_date = '2022-01-01'

    expect do
      book.add_rental(rental_date, person)
    end.to change { book.rentals.length }.by(1)

    expect(book.rentals.last[:date]).to eq(rental_date)
    expect(book.rentals.last[:book]).to eq(book.to_h)
    expect(book.rentals.last[:person]).to eq(person.to_h)
  end
end

# Test for to_h
describe Book do
  let(:book) { Book.new('Big City', 'William Cool') }

  describe '#to_h' do
    it 'returns a hash representation of the book' do
      expected_hash = { title: 'Big City', author: 'William Cool', rentals: [] }
      expect(book.to_h).to eq(expected_hash)
    end
  end
end
