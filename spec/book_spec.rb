require_relative '../book'

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
