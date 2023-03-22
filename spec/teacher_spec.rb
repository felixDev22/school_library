require_relative '../teacher'

describe 'Teacher instance' do
  it 'creates an instance of the Teacher class' do
    teacher = Teacher.new('Chemisty', 35, 'Juma')
    expect(teacher.class).to eq Teacher
  end
end

describe '#specialization' do
  it 'returns the specialization of the teacher' do
    teacher = Teacher.new('Chemisty', 35, 'Juma')
    expect(teacher.specialization).to eq 'Chemisty'
  end
end

describe '#can_use_services?' do
  it 'returns true' do
    teacher = Teacher.new('Chemisty', 35, 'Juma')
    expect(teacher.can_use_services?).to eq true
  end
end
