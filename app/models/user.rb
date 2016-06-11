class User < ActiveRecord::Base
  #attr_accessible :p_lastname, :m_lastname
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :dni, :first_name, :p_lastname, :m_lastname, :address, :phone
  before_save :join_lastnames
  before_validation :set_user_password

  self.inheritance_column = :role

  def self.roles
    %w(Admin Student Teacher Secretary Guardian)
  end

  def admin?
    role == "Admin"
  end

  def p_lastname
    last_name ? self.last_name.split(" ")[0] : @p_lastname
  end

  def p_lastname=(val)
    @p_lastname = val
  end

  def m_lastname
    last_name ? self.last_name.split(" ")[1] : @m_lastname
  end

  def m_lastname=(val)
    @m_lastname = val
  end

  def join_lastnames
    self.last_name = [@p_lastname, @m_lastname].join(" ")
  end

  def set_user_password
    self.password = self.dni if self.password.blank?
  end

  def full_name
    [last_name, first_name].join(", ")
  end
end
