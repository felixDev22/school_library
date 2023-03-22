require_relative '../person'

describe Person do
  context 'with one parameters' do
    it 'takes three parameters' do
      person = Person.new(age: 20, parent_permission: 'Y', name: 'john')
      expect(person).to be_an_instance_of Person
    end
  end
end
