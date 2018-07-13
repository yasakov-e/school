# frozen_string_literal: true

class Achievement < ApplicationRecord
  belongs_to :user, -> { User.student }
  belongs_to :lesson
  POINTS_RANGE = 1..12
  POINTS_LENGTH_RANGE   = 1..2

  validates :points, inclusion: { in: POINTS_RANGE }
  validates :points, length: { in: POINTS_LENGTH_RANGE }
  validates :attendance, inclusion: { in: [true, false] }
end
