require './decorator'

describe TrimmerDecorator do
  name = TrimmerDecorator.new('meghan_Trainor')
  timmer_function = name.nameable.slice(0, 10)

  context 'calls correct_name' do
    it 'returns correct title' do
      expect(name.nameable).to eq('meghan_Trainor')
    end
    it 'returns trimmed name' do
      expect(timmer_function).to eq('meghan_Tra')
    end
  end
end
