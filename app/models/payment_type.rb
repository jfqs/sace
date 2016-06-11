class PaymentType < ActiveRecord::Base
  validates_presence_of :name, :amount
  scope :for_enrollment, ->{ where(name: "Matricula").first }
  scope :others, ->{ where("name not similar to '(Mat|Men)%'") }
end
