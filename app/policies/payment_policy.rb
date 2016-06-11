class PaymentPolicy < ApplicationPolicy
  def index?
    user.role == "Guardian" or user.admin?
  end

  def create?
    user.role == "Secretary" or user.admin?
  end

  def new_assign?
    create?
  end

  def assign?
    new_assign?
  end

  def pending?
    update?
  end

  def update?
    user.role == "Guardian" or user.admin?
  end
end