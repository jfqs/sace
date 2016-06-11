class Payment < ActiveRecord::Base
  belongs_to :student
  belongs_to :payment_type
  belongs_to :period

  after_update :add_monthly_payments

  def add_monthly_payments
    if self.payment_type_id == 1
      PaymentType.where("name like 'Mens%'").each do |p|
        Payment.create(student_id: self.student_id, payment_type_id: p.id, period_id: Period.current_period)
        #self.student.payments << Payment.create(payment_type_id: p.id, period_id: Period.current_period)
      end

      Enrollment.where(period_id: Period.current_period, student_id: self.student_id).first.update_attribute(:state, 1)
    end
  end
end
