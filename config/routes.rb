Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  root to: 'main#index'

  resource :word, only: [:create, :show, :update] do
    get ':phrase_id/check', action: :check
  end
end
