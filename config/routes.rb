Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  root to: 'main#index'

  resources :words, only: [:create, :show, :update]
  get 'words/:id/learn', to: 'words#learn', as: :learn_word
  get 'words/:id/check_word', to: 'words#check_word', as: :check_word
  get 'words/:phrase_id/check', to: 'words#check', as: :check_phrase

  resources :phrases, only: [:destroy]
end
