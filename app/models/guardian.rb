class Guardian < User
  has_many :students, foreign_key: :guardian_id , dependent: :destroy
  accepts_nested_attributes_for :students, allow_destroy: true
end