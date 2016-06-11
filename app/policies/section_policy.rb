class SectionPolicy < ApplicationPolicy
  def search?
    user.admin? or user.role == "Secretary"
  end
end