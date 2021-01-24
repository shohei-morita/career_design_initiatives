Rails.application.routes.draw do
  root 'top#top'
  get 'top/applicaiton_completion', to: 'top#application_completion'

  devise_for :students, controllers: { registrations: 'students/registrations'}
  devise_for :recruiters, controllers: { registrations: 'recruiters/registrations' }

  devise_scope :recruiter do
    post 'recruiters/registrations/confirm', to: 'recruiters/registrations#confirm', as: :confirm_application
    get 'recruiters/registrations/:id/edit_password', to: 'recruiters/registrations#edit_password', as: :edit_password
    put 'recruiters/registrations/:id/update_password', to: 'recruiters/registrations#update_password', as: :update_password
    get 'recruiters/registrations/:id/show_profile', to: 'recruiters/registrations#show_profile', as: :show_profile
    get 'recruiters/registrations/:id/edit_profile', to: 'recruiters/registrations#edit_profile', as: :edit_profile
    put 'recruiters/registrations/:id/update_profile', to: 'recruiters/registrations#update_profile', as: :update_profile
  end

  resources :recruiters do
    collection do
      get :home
      get :settings
    end
    resource :company, only: %i(show edit update)
    resources :job_informations do
      collection do
        post :confirm
      end
    end
  end

  namespace :admin do
    resources :recruiters
  end

  resources :students, only: %i(index show) do
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

  resources :scouts do
    resources :scout_messages
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
