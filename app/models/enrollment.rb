class Enrollment < ActiveRecord::Base
  #belongs_to :student, foreign_key: "student_id", class_name: "student"
  #belongs_to :secretary, foreign_key: "secretary_id", class_name: "secretary"
  belongs_to :student
  belongs_to :secretary
  belongs_to :section
  belongs_to :period

  before_validation :set_enrollment_state
  after_create :set_enrollment_payment

  def set_enrollment_payment
    Payment.create(student_id: self.student_id, payment_type_id: PaymentType.for_enrollment.id, period_id: Period.current_period)
    #self.student.payments << Payment.create(payment_type_id: PaymentType.for_enrollment.id, period_id: Period.current_period,)
  end

  def set_enrollment_state
    self.state = 0 unless self.state == 0
  end


end
