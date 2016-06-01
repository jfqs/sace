class EnrollmentPolicy < ApplicationPolicy
  def edit?
    update?
  end

  def update?
    user.role == "Secretary"
  end
end