class Person
    attr_reader :id #getter
    attr_accessor :name, :age #getter and setter

    def initialize(name = "Unknown", age, parent_permission = true)
        @id = id Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def can_use_services?
        @parent_permission || of_age?
    end

    def of_age?
        @age >= 18
    end
    
    private :of_age?
   

end