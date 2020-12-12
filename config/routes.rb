Rails.application.routes.draw do
  root 'top#top'
  devise_for :students

  get :signup,  to: 'students#new'
  resources :students

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
