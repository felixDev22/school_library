def create_teacher
  puts 'create a new teacher'

  age = nil
  until age&.positive?
    puts 'Age (must be a positive integer):'
    age = gets.chomp.to_i
  end

  name = nil
  until name && !name.empty?
    puts 'Name:'
    name = gets.chomp.strip
  end

  specialization = nil
  until specialization && !specialization.empty?
    puts 'Specialization:'
    specialization = gets.chomp.strip
  end

  teacher = Teacher.new(age, name, specialization)
  @people << teacher
  save_data(@people, 'people.json')
  puts 'Teacher created successfully'
end
