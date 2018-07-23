# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LessonsController, type: :controller do
  # Helpers definition
  let(:other_role) { FactoryBot.create(:valid_user_for_mentor_role) }

  let(:student) { FactoryBot.create(:valid_user_with_group) }
  let(:teacher) { course.user }
  let(:course) { hometask.lesson.theme.course }
  let(:hometask) { FactoryBot.create(:valid_hometask_with_all_optional) }
  # let(:lesson) { FactoryBot.create(:valid_lesson_with_all_optional) }
  describe 'GET #new' do
    render_views
    it 'render lessons/new template with teacher role' do
      login_with teacher
      get :new
      expect(response).to render_template('lessons/new')
    end
    it 'redirects to root if user is not a teacher' do
      login_with student
      get :new
      expect(response).to redirect_to root_path
    end
  end

  describe 'GET #edit' do
    render_views
    it 'render lessons/edit template with teacher role' do
      login_with teacher
      get :edit, params: { id: hometask.lesson.id }
      expect(response).to render_template('lessons/edit')
    end
    it 'redirects to root if user is not a teacher' do
      login_with other_role
      get :edit, params: { id: hometask.lesson.id }
      expect(response).to redirect_to root_path
    end
  end

  describe 'POST #create' do
    render_views
    it 'redirects to lessons path if hometask has valid parameters' do
      login_with teacher
      post :create, params: { lesson: { topic: 'valid_topic', theme_id: hometask.lesson.theme_id } }
      expect(response).to redirect_to course_path(id: course.id)
    end
    it 'redirects to root if user is not a teacher' do
      login_with other_role
      post :create, params: { lesson: { topic: 'valid_topic', theme_id: hometask.lesson.theme_id } }
      expect(response).to redirect_to root_path
    end
    it 'render lessons/new if lesson has invalid parameters' do
      login_with teacher
      post :create, params: { lesson: { topic: 'inv', theme_id: hometask.lesson.theme_id } }
      expect(response).to render_template('lessons/new')
    end
  end

  describe 'PUT #update' do
    render_views
    it 'updates lesson with valid parameters' do
      login_with teacher
      put :update, params: { id: hometask.lesson.id, lesson: { topic: 'new_topic' } }
      expect(Lesson.find(hometask.lesson.id).topic).to eq('new_topic')
    end
    it 'does not update lesson with invalid parameters' do
      login_with teacher
      put :update, params: { id: hometask.lesson.id, lesson: { topic: 'va' } }
      expect(Lesson.find(hometask.lesson.id).topic).not_to eq('va')
    end
    it 'redirects to root if user is not a teacher' do
      login_with other_role
      put :update, params: { id: hometask.lesson.id, lesson: { topic: 'new_topic' } }
      expect(response).to redirect_to root_path
    end
  end

  describe 'DELETE #destroy' do
    render_views
    it 'destroys lesson with valid parameters' do
      login_with teacher
      delete :destroy, params: { id: hometask.lesson.id }
      expect(response).to redirect_to course_path(id: course.id)
    end
    it 'redirects to root if user is not a teacher' do
      login_with other_role
      delete :destroy, params: { id: hometask.lesson.id }
      expect(response).to redirect_to root_path
    end
  end
end
