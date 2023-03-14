require_relative './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end
