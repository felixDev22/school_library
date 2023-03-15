require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, parent_permission: true, name: 'Unknown')
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom = (classroom)
    @classroom = classroom
    classroom.student.push(self)
  end
end
