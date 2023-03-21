def list_rentals
  puts 'Enter the ID of the person:'
  id = gets.chomp.to_i
  person = @people.find { |p| p.id == id }
  if person.nil?
    puts 'No person found with that ID'
    return
  end

  rentals = @rentals.select { |rental| rental.person == person }
  if rentals.empty?
    puts 'No rentals found for that person'
    return
  end

  puts "Rentals for #{person.name}:"
  rentals.each do |rental|
    puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
  end
end
