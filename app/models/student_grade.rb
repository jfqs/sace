class StudentGrade < ActiveRecord::Base
  belongs_to :student
  belongs_to :period
  belongs_to :programmed_section
  belongs_to :grade_type
end
