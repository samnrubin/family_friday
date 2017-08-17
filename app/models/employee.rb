class Employee < ApplicationRecord
  def self.groups(employees)
    return [employees] if employees.length < 6

    employees = group_up(employees.shuffle)

    fix_stragglers(employees)
  end

  def self.group_up(employees)
    employee_groups = [[]]

    employees.each do |employee|
      if employee_groups.last.length >= 4
        employee_groups << []
      end

      employee_groups.last << employee
    end

    employee_groups
  end

  def self.fix_stragglers(employee_groups)
    # add straggler to previous group if there's 1
    if employee_groups.last.length == 1
      odd = employee_groups.pop
      employee_groups.last << odd.pop

    # add employee from previous group to stragglers if there's 2
    elsif employee_groups.last.length == 2
      odd = employee_groups[-2].pop
      employee_groups.last << odd
    end

    employee_groups
  end
end
