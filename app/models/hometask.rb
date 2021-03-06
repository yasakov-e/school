# frozen_string_literal: true

class Hometask < ApplicationRecord
  belongs_to :lesson
  validates :description, presence: true
  validates :description, length: { minimum: 3 }
  scope :for_course, lambda { |course|
                       joins(:lesson).where(lessons: { theme_id: course.themes })
                     }
  def subject_name
    lesson.theme.course.subject.name
  end

  def group_name
    lesson.theme.course.group.name
  end
end
