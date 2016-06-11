class Student < User
  has_many :student_grades
  has_many :enrollments, ->{ includes :student}
  has_many :sections, through: :enrollments
  has_many :payments
  belongs_to :guardian, foreign_key: :guardian_id

  def current_period_enrollment
    enrollments.where(period_id: Period.current_period).first
#    puts "wan"
  end

end