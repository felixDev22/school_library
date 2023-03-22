require_relative '../trimmer_decorator'
require_relative '../decorator'

describe TrimmerDecorator do
  let(:nameable) { double('nameable') }
  subject { described_class.new(nameable) }
  describe '#correct_name' do
    context 'when name is longer than 10 characters' do
      before do
        allow(nameable).to receive(:correct_name).and_return('12345678901')
      end
      it 'returns the first 10 characters' do
        expect(subject.correct_name).to eq('1234567890')
      end
    end
    context 'when name is shorter than 10 characters' do
      before do
        allow(nameable).to receive(:correct_name).and_return('12345')
      end
      it 'returns the name as is' do
        expect(subject.correct_name).to eq('12345')
      end
    end
  end
end
