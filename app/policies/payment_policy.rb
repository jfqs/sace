class PaymentPolicy < ApplicationPolicy
  def index?
    user.role == "Guardian"
  end

  def create?
    user.role == "Secretary"
  end

  def assign?
    create?
  end

  def pending?
    update?
  end

  def update?
    user.role == "Guardian"
  end
end