Rails.application.routes.draw do
  get 'addresses/new'
  get 'addresses/create'
  get 'addresses/show'
  get 'addresses/edit'
  get 'addresses/update'
  root 'top#top'
  devise_for :students, controllers: { registrations: 'students/registrations'}

  resources :students, only: %i(show) do
    collection do
      get :home
      get :profile
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
