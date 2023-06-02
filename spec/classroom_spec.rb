require './classroom'
require './student'

describe Classroom do
  context '#initialize' do
    it 'sets the label' do
      classroom = Classroom.new('Science')
      expect(classroom.label).to eq('Science')
    end
  end

  context 'add_student' do
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
