def create_student
  age = request_age
  name = request_name
  parent_permission = request_parent_permission
  return if parent_permission.nil?

  student = Student.new(classroom: @classroom, age: age, parent_permission: parent_permission, name: name)
  @people << student
  save_data(@people, 'people.json')
  puts 'Student created successfully'
end

def request_age
  puts 'Age:'
  age = gets.chomp.to_i
  while age <= 0
    puts 'Invalid input. Please enter a positive number for age:'
    age = gets.chomp.to_i
  end
  age
end

def request_name
  puts 'Name:'
  name = gets.chomp
  while name.empty?
    puts 'Invalid input. Please enter a non-empty name:'
    name = gets.chomp
  end
  name
end

def request_parent_permission
  puts 'Has parent permission? [Y/N]:'
  parent_permission = gets.chomp.downcase
  until %w[y n].include?(parent_permission)
    puts 'Invalid input. Please enter Y or N:'
    parent_permission = gets.chomp.downcase
  end
  parent_permission == 'y'
end
