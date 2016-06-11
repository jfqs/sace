class Section < ActiveRecord::Base
  belongs_to :education_degree
  has_many :enrollments
  has_many :students, through: :enrollments

  has_many :programmed_sections
  has_many :courses, through: :programmed_sections

  def route_name
    [education_degree.education_level.name, education_degree.name, name].join(" - ")
  end
end
