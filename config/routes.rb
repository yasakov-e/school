# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'articles#index'

  get 'articles/index'

  get 'articles/show'
end
