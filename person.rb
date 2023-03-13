class Person
  def initialize(name = 'Unknown', age,  parent_permission=true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  # getter for id
  attr_reader :id

  # getter and setter for name and age
  attr_accessor :name, :age


  private

   def is_of_age?
    @age >= 18
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end
end