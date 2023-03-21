require 'JSON'

def save_data(data, filename)
  return unless data

  save_input = data.map(&:to_h) # Convert each object to a hash
  File.write(filename, JSON.generate(save_input))
end

def load_data(filename)
  if File.exist?(filename)
    json = File.read(filename)
    JSON.parse(json)
  else
    # Handle the case when the file is missing
    []
  end
end
