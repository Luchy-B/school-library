require './student'
require './classroom'

describe Student do
  context '#initialize' do
    it 'sets the name, age and specialization' do
      teacher = Student.new('Science', 20, 'Mary')
      expect(teacher.classroom).to eq('Science')
      expect(teacher.age).to eq(20)
      expect(teacher.name).to eq('Mary')
    end
  end

  context '#play_hooky' do
    it 'should return the play_hooky' do
      student = Student.new('Musong', 21, true)
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  context '#add_classroom' do
    student = Student.new('Blessing', 21, true)
    student_classroom = Classroom.new('Science')

    it 'should add the student to the given classroom' do
      student.classroom = student_classroom
      expect(student.classroom).to eq(student_classroom)
    end

    it "adds the student to the new classroom's students array" do
      student.classroom = student_classroom
      expect(student_classroom.students).to include(student)
    end
  end
end
