# frozen_string_literal: true

class LessonsController < ApplicationController
  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to course_path(id: @lesson.theme.course_id),
                  notice: t('actions.success.create',
                            resource: lesson_locale)
    else
      render :new
    end
  end

  def edit
    lesson
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to course_path(id: @lesson.theme.course_id),
                  notice: t('actions.success.update',
                            resource: lesson_locale)
    else
      render :edit
    end
  end

  def destroy
    lesson.destroy
    redirect_to course_path(id: @lesson.theme.course_id),
                notice: t('actions.success.destroy',
                          resource: lesson_locale)
  end

private

  def lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:topic, :description, :links, :date, :theme_id)
  end

  def lesson_locale
    t('activerecord.models.lesson.one')
  end
end
