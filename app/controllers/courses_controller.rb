# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    if current_user.student?
      @courses = Course.groups_for_user(current_user).includes(:subject)
    elsif current_user.teacher?
      @courses = current_user.courses.includes(:group)
    else
      redirect_to root_path
    end
  end
end
