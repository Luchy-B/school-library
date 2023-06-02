require './person'

describe Person do
  context 'Should create person object' do
    it 'Should create person age' do
      person = Person.new(29, 'Tessy Stephen')
      expect(person.age).to eq(29)
    end

    it 'Should create person name' do
      person = Person.new(29, 'Tessy Stephen')
      expect(person.name).to eq('Tessy Stephen')
    end
  end

  context 'when the person has parent permission' do
    it 'returns true' do
      person = Person.new(29, 'Tessy Stephen')
      use_serv = person.can_use_services?
      expect(use_serv).to be true
    end
  end

  context 'of_age?' do
    it 'Should return true if person is over 18' do
      person = Person.new(29, 'Tessy Stephen')
      of_age = person.can_use_services?
      expect(of_age).not_to be false
    end
  end
end
