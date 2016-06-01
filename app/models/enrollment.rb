class Enrollment < ActiveRecord::Base
  #belongs_to :student, foreign_key: "student_id", class_name: "student"
  #belongs_to :secretary, foreign_key: "secretary_id", class_name: "secretary"
  belongs_to :student
  belongs_to :secretary
  belongs_to :section
end
