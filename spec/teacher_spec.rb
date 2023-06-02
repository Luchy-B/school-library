# teacher_spec
require './teacher'
describe Teacher do
  context '#initialize' do
    it 'sets the name, age and specialization' do
      teacher = Teacher.new('Science', 20, 'Mary')
      expect(teacher.specialization).to eq('Science')
      expect(teacher.age).to eq(20)
      expect(teacher.name).to eq('Mary')
    end
  end
  context '#can_use_services?' do
    it 'should return true' do
      teacher = Teacher.new('Science', 20, 'Mary')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
