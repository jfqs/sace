class StudentGradePolicy < ApplicationPolicy
  def report_card?
    user.role == "Guardian" or user.role == "Student"
  end

  def new?
    create?
  end

  def create?
    user.role == "Teacher"
  end

  def course_grades?
    create?
  end
end