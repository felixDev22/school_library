require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:classroom) { Classroom.new('Math 101') }
  let(:student) { Student.new(classroom: classroom, age: 16, parent_permission: 'y', name: 'Alice') }

  describe '#add_student' do
    it 'adds the student to the classroom' do
      expect do
        classroom.add_student(student)
      end.to change { classroom.students.length }.by(1)

      expect(classroom.students).to include(student)
    end
  end
end
