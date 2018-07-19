# frozen_string_literal: true

class HometasksController < ApplicationController
  def index
    @hometasks = []
    current_user.group.courses.each do |course|
      @hometasks << Hometask.for_course(course).last
    end
  end
end
