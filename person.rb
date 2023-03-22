require_relative './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :books, :rentals

  def initialize(age:, parent_permission: true, name: 'Unknown')
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  def correct_name
    @name.correct_name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def to_h
    {
      name: @name,
      id: @id,
      age: @age,
      parent_permission: @parent_permission,
      rentals: @rentals.map(&:to_h)
    }
  end

  private

  def of_age?
    @age >= 18
  end
end
