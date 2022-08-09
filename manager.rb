require_relative "employee"

class Manager < Employee 
    attr_reader :employees

    def initialize(name, title, salary, boss = nil, employees)
        super(name, title, salary, boss = nil)
        @employees = employees
    end

    def bonus(multiplier)
        total_salary = employees.inject(0) { |sum, employee| sum += employee.salary }
        total_salary * multiplier
    end

end

shawna = Employee.new("Shawna", "TA", 12_000)
david = Employee.new("David", "TA", 10_000)
darren = Manager.new("Darren", "TA Manager", 78_000, [shawna, david])
ned = Manager.new("Ned", "Founder", 1_000_000, [darren, shawna, david])

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)