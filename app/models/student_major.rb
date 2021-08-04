class StudentMajor < ApplicationRecord
    belongs_to :majors
    belongs_to :users
end
