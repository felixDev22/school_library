require 'spec_helper'

describe Student do
  it 'Should create instance of the student class' do
    student = Student.new(classroom: 6, age: 13, parent_permission: 'Yes', name: 'Mark')
    expect(student).to be_an_instance_of Student
  end
end

describe '#play_hooky' do
  it 'should show play_hooky symbol' do
    student = Student.new(classroom: 6, age: 13, parent_permission: 'Yes', name: 'Mark')
    expect(student.play_hooky).to eq '¯\(ツ)/¯'
  end
end

# Classroom test
describe Student do
  let(:classroom) { Classroom.new(6) }
  let(:student) { Student.new(classroom: 5, age: 13, parent_permission: true, name: 'John') }

  describe '#classroom' do
    context 'when the student is not already in the classroom' do
      it 'adds the student to the classroom' do
        expect { student.classroom = classroom }.to change { classroom.students.size }.by(1)
        expect(classroom.students).to include(student)
      end
    end

    context 'when the student is already in the classroom' do
      it 'does not add the student to the classroom again' do
        classroom.students.push(student)
        expect { student.classroom = classroom }.not_to change { classroom.students.size }
      end
    end
  end
end
