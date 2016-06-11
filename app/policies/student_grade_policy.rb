class StudentGradePolicy < ApplicationPolicy
  def report_card?
    user.role == "Guardian" or user.role == "Student" or user.admin?
  end

  def new?
    create?
  end

  def create?
    user.role == "Teacher" or user.admin?
  end

  def course_grades?
    create?
  end
end