class Period < ActiveRecord::Base
  has_many :enrollments
  scope :current_period, ->{ where(bimester: nil).last.id}
end
