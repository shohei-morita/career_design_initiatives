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
    resources :job_informations
  end

  resources :target_lists, only: %i(index create destroy)

  namespace :admin do
    resources :recruiters, except: %i(show) do
      member do
        get :edit_student
        patch :update_student
        delete :destroy_student
      end
    end
  end

  resources :students, only: %i(index show) do
    collection do
      get :home
      get :profile
      get :pr
    end

    member do
      get :company_show
    end

    resource :address, except: %i(destroy)
    resource :educational_background, except: %i(destroy)
    resource :qualification, except: %i(destroy)
    resources :extracurricular_activities
    resources :awards

    resource :apealing_point, controller: :self_introductions, type: 'ApealingPoint', except: %i(destroy)
    resource :apealing_image, controller: :self_introductions, type: 'ApealingImage', except: %i(destroy)
    resource :apealing_video, controller: :self_introductions, type: 'ApealingVideo', except: %i(destroy)
  end

  resources :scouts, only: %i(index create) do
    resources :scout_messages, only: %i(index create)
  end

  resources :notifications, only: %i(index show)

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
