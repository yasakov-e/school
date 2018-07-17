# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    if current_user.student?
      @courses = Course.where(group_id: current_user.group_id).includes(:subject)
    elsif current_user.teacher?
      @courses = current_user.courses.includes(:groups)
    end
  end
end
