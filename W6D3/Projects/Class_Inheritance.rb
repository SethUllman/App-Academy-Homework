class Employee

  attr_reader :name, :title, :boss, :salary

  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee

  attr_reader :employees
  
  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    que = self.employees
    salaries = 0
    until que.empty?
      employee = que.shift
      salaries += employee.salary
      que += employee.employees if employee.class == Manager
    end
    salaries * multiplier
  end
end

Ned = Manager.new("Ned", "Founder", (1000000), nil)
Darren = Manager.new("Darren", "TA Manager", (78000), "Ned")
Shawna = Employee.new("Shawna", "TA", (12000), "Darren")
David = Employee.new("David", "TA", (10000), "Darren")

Ned.add_employee(Darren)
Darren.add_employee(Shawna)
Darren.add_employee(David)

