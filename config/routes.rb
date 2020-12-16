Rails.application.routes.draw do
  root 'top#top'
  devise_for :students, controllers: { registrations: 'students/registrations'}

  resources :students, only: %i(index show)
  resources :profile, only: %i(index)

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
