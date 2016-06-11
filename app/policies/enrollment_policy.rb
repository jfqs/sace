class EnrollmentPolicy < ApplicationPolicy
  def index?
    user.role == "Secretary" or user.admin?
  end

  def new?
    create?
  end

  def create?
    user.role == "Secretary" or user.admin?
  end

  def edit?
    update?
  end

  def update?
    user.role == "Secretary" or user.admin?
  end
end