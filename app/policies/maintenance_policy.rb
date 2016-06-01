class MaintenancePolicy < Struct.new(:user, :maintenance)
  def upload?
    update?
  end

  def update?
    user.admin?
  end
end