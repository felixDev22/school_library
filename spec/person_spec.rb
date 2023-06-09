require 'spec_helper'

describe Person do
  let(:person) { Person.new(20, 'Alice', parent_permission: false) }
  context 'with one parameters' do
    it 'takes three parameters' do
      person = Person.new(age: 20, parent_permission: 'Y', name: 'john')
      expect(person).to be_an_instance_of Person
    end
  end

  describe '#initialize' do
    it 'creates a new Person instance with given attributes' do
      person = Person.new(age: 18, name: 'John', parent_permission: 'true')
      @id = Random.rand(1..1000)
      @rentals = []
      expect(person.name).to eq('John')
      expect(person.age).to eq(18)
      expect(person.id).to_not be_nil
    end
  end

  #   describe '#correct_name' do
  #   it 'returns the person\'s name' do
  #     expect(person.correct_name).to eq('Alice')
  #   end
  # end

  describe '#can_use_services?' do
    it 'returns true if the Person is of age or has parent permission' do
      person = Person.new(age: 18, name: 'John')
      expect(person.can_use_services?).to be_truthy
    end
  end

  let(:person) { Person.new(age: 27, parent_permission: true, name: 'John Doe') }

  describe '#to_h' do
    it 'returns a hash representation of the person' do
      expected_hash = { name: 'John Doe', id: person.id, age: 27, parent_permission: true, rentals: [] }
      expect(person.to_h).to eq(expected_hash)
    end
  end

  describe '#of_age?' do
    context 'when age is greater than or equal to 18' do
      it 'returns true' do
        person = Person.new(age: 18)
        expect(person.send(:of_age?)).to be true

        person = Person.new(age: 20)
        expect(person.send(:of_age?)).to be true
      end
    end

    context 'when age is less than 18' do
      it 'returns false' do
        person = Person.new(age: 17)
        expect(person.send(:of_age?)).to be false

        person = Person.new(age: 12)
        expect(person.send(:of_age?)).to be false
      end
    end
  end

  before :each do
    @person = Person.new(age: 20, parent_permission: 'Y', name: 'Tati')
  end
  describe '#add_rental' do
    context 'before adding rental' do
      it 'should have no rental' do
        expect(@person.rentals.length).to eql 0
      end
    end
  end
  describe '#name' do
    it 'returns the correct name' do
      expect(@person.name).to eql('Tati')
    end
  end
end
