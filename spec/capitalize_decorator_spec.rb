# capitaliza_decorator_specs.rb
require './decorator'
describe CapitalizeDecorator do
  name = CapitalizeDecorator.new('meghan_trainor')
  context 'given an instance' do
    it 'returns correct title' do
      expect(name.nameable).to eq('meghan_trainor')
    end
    it 'capitalize the input' do
      expect(name.nameable.capitalize).to eq('Meghan_trainor')
    end
  end
end
