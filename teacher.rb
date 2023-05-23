require_relative './person'

class teacher < person
    def initialize(name = "Unknown", age, parent_permission = true, specialization)
        super(name, age, parent_permission)
        @specialization = specialization
    end
    
    def can_use_services?
        true
    end
end