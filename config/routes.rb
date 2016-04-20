Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  root to: 'main#index'

  resource :word, only: [:create, :show] do
    get ':phrase_id/check', action: :check
  end
end
