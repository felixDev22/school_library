require 'JSON'

def save_data(data, filename)
  save_input = data.map(&:to_h) # Convert each object to a hash
  File.write(filename, JSON.generate(save_input))
end

def load_data(filename)
  if File.exist?(filename)
    begin
      json = File.read(filename)
      JSON.parse(json)
    rescue JSON::ParserError
      puts 'Data list empty'
      []
    end
  else
    puts "File #{filename} is missing."
    []
  end
end
