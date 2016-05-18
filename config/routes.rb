Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  root to: 'main#index'

  resources :words, only: [:create, :show, :update]
  get 'words/:phrase_id/check', to: 'words#check', as: :check_phrase

  resources :phrases, only: [:destroy]
end
