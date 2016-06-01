class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  self.inheritance_column = :role

  def self.roles
    %w(Admin Student Teacher Secretary Guardian)
  end

  def admin?
    role == "Admin"
  end
end
