require_relative './person'

# Teacher class
class Teacher < Person
  attr_accessor :age, :name, :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission: true)

    super(age, name, parent_permission: parent_permission)

    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
# Path: student.rb
