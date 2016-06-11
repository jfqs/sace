class Teacher < User
  has_many :programmed_sections
  has_many :courses, through: :programmed_sections
end