class EducationLevel < ActiveRecord::Base
  has_many :education_degrees
end
