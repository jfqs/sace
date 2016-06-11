class EducationDegree < ActiveRecord::Base
  belongs_to :education_level
  has_many :sections
end
