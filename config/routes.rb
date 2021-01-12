Rails.application.routes.draw do
  root 'top#top'
  get 'top/applicaiton_completion', to: 'top#application_completion'

  devise_for :students, controllers: { registrations: 'students/registrations'}
  devise_for :recruiters, controllers: { registrations: 'recruiters/registrations' }

  resources :recruiters do
    collection do
      get :home
    end
    resource :company, only: %i(show edit update)
  end

  namespace :admin do
    resources :recruiters
  end

  resources :students, only: %i(show) do
    collection do
      get :home
      get :profile
      get :pr
    end

    resource :address
    resource :educational_background
    resources :extracurricular_activities
    resources :awards

    resource :apealing_point, controller: :self_introductions, type: 'ApealingPoint'
    resource :apealing_image, controller: :self_introductions, type: 'ApealingImage'
    resource :apealing_video, controller: :self_introductions, type: 'ApealingVideo'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
