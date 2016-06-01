class StudentPolicy < ApplicationPolicy
  def index?
    user.role == "Secretary"
  end

  def new?
    create?
  end

  def create?
    user.role == "Secretary"
  end
end