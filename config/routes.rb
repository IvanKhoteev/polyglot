Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  resource :word, only: [:create]
end
