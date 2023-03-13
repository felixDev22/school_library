require './person'

class Teacher < Person
  def initialize(name = 'Unknown', specialization, age, parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
