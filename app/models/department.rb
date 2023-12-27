class Department < ApplicationRecord
  validates :department_code, :department_name, presence: true
  belongs_to :hospital
end
