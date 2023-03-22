require_relative '../student'

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
