class PaymentTypePolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    user.role == "Secretary"
  end
end