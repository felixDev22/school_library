require './person'

class Teacher < Person
  def initialize(specialization, age, parent_permission: true, name: "Unknown")
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
