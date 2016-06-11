class ProgrammedSection < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :course
  belongs_to :section
end
