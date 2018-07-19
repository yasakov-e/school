# frozen_string_literal: true

class HometasksController < ApplicationController
  def index
    if current_user.student?
      @hometasks = []
      current_user.group.courses.each do |course|
        @hometasks << Hometask.for_course(course).last
      end
    else
      redirect_to root_path
    end
  end
end
