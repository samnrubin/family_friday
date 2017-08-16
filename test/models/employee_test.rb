require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "There are no groups greater than 4 after a group_up call of 4" do
    employees = %w( 1 2 3 4 5 6 )
    grouped = Employee.group_up(employees)
    grouped.each do |group|
      assert group.length <= 4
    end
  end

  test "There are no groups greater than 4 after a group_up call of 6" do
    employees = %w( 1 2 3 4 5 6 )
    grouped = Employee.group_up(employees)
    grouped.each do |group|
      assert group.length <= 4
    end
  end

  test "There are no groups greater than 4 after a group_up call of 9" do
    employees = %w( 1 2 3 4 5 6 7 8 9 )
    grouped = Employee.group_up(employees)
    grouped.each do |group|
      assert group.length <= 4
    end
  end

  test "There are no stragglers with a final group of 1" do
    employees = [%w( 1 2 3 4 ), %w( 5 )]
    grouped = Employee.fix_stragglers(employees)
    grouped.each do |group|
      assert group.length >= 3 && group.length <= 5
    end
  end

  test "There are no stragglers with a final group of 2" do
    employees = [%w( 1 2 3 4 ), %w( 5 6 )]
    grouped = Employee.fix_stragglers(employees)
    grouped.each do |group|
      assert group.length >= 3 && group.length <= 5
    end
  end

  test "There are no stragglers with a final group of 3" do
    employees = [%w( 1 2 3 4 ), %w( 5 6 7 )]
    grouped = Employee.fix_stragglers(employees)
    grouped.each do |group|
      assert group.length >= 3 && group.length <= 5
    end
  end
end
