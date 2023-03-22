require_relative '../nameable'

describe Nameable do
  describe '#correct_name' do
    it 'raises NotImplementedError' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
