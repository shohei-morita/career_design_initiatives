Rails.application.routes.draw do
  root 'top#top'
  get 'top/company', to: 'top#company'
  get 'top/applicaiton_completion', to: 'top#application_completion'

  devise_for :students, controllers: {
    registrations: 'students/registrations',  sessions: "students/sessions"
  }
  devise_for :recruiters, controllers: {
    registrations: 'recruiters/registrations',
    sessions: "recruiters/sessions"
  }

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
      get :search_student
    end
    resource :company, only: %i(show edit update)
    resources :job_information
  end

  resources :target_lists, only: %i(index create destroy)

  namespace :admin do
    resources :recruiters, except: %i(show) do
      collection do
        get :home
        get :student_index
      end
      member do
        get :edit_student
        patch :update_student
        delete :destroy_student
      end
    end
  end

  resources :students, only: %i(show) do
    collection do
      get :home
      get :profile
      get :pr
    end

    member do
      get :company_show
    end

    resource :educational_background, except: %i(destroy)
    resource :qualification, except: %i(destroy)
    resources :extracurricular_activities
    resources :awards

    resource :apealing_point, controller: :self_introductions, type: 'ApealingPoint', except: %i(destroy)
    resource :apealing_image, controller: :self_introductions, type: 'ApealingImage', except: %i(destroy)
    resource :apealing_video, controller: :self_introductions, type: 'ApealingVideo', except: %i(destroy)
  end

  resources :scouts, only: %i(index new create) do
    resources :scout_messages, only: %i(index new create)
  end

  resources :notifications, only: %i(index new create show destroy)

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
