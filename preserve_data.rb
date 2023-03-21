require 'JSON'

def save_data(data, filename)
  save_data_h = data.map(&:to_h) # Convert each object to a hash
  File.write(filename, JSON.generate(save_data_h))
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
