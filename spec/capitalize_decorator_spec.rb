require_relative '../capitalizer_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'Kimani') }
  let(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the first letter of the name' do
      expect(decorator.correct_name).to eq('Kimani')
    end

    it 'calls correct_name on the decorated object' do
      expect(nameable).to receive(:correct_name)
      decorator.correct_name
    end
  end
end
