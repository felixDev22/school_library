require_relative '../decorator'

describe Decorator do
  describe '#correct_name' do
    context 'when decorated object is nameable' do
      let(:nameable) { double('nameable', correct_name: 'Kimani') }
      subject { described_class.new(nameable).correct_name }

      it 'calls correct_name on decorated object' do
        expect(nameable).to receive(:correct_name)
        subject
      end

      it 'returns the correct name' do
        expect(subject).to eq 'Kimani'
      end
    end
  end
end
