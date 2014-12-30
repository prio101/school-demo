SchoolWings::Application.routes.draw do



  # get 'manual_attendance' => 'attendances#manual_attendance'
  # post 'create_mass_attendance' => 'attendances#create_mass_attendance'
  # match 'attendances', to: 'attendances#create', via: [:options]
  resources :attendances


  resources :cards

  resources :government_salaries

  resources :teachers

  resources :departments

  resources :subjects

  resources :defaulter_settings
  resources :student_defaulter_settings

  root "homepage#index"
  get 'main/home' => "main#home"
  get 'main/student_balance_information'

  devise_for :users
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config.merge(:path => '')

  resources :course_sections, path: 'class_sections'
  resources :users
  resources :collection_schedules, path: 'fee_collections'
  resources :invoices
  resources :fee_categories, path: 'school_fees'
  resources :students do
    collection { post :import }
    collection { get :import }
    member { get :assign_subjects }
    resources :results
    resources :student_balances
    resources :parents
    collection do
      get :dashboard
      get :defaulters
    end
  end
  resources :courses, path: 'classes' do
    collection do
      get :dashboard
    end
  end
  resources :fees, path: 'fees' do
    collection do
      get :dashboard
    end
  end
  resources :batches, path: 'school_years' do
    collection do
      get :dashboard
    end
    resources :courses, path: 'classes' do
      collection do
        get :dashboard
      end
    end
    resources :students do
      collection do
        get :dashboard
      end
    end
  end

  get "ajax/select_section"
  get "ajax/select_course"

  namespace 'api' do
    namespace 'v1' do
      controller :access_request do
        get 'access_code' => :access_code
      end

     controller :students do
       get 'balance' => :balance
       post 'balance' => :add_balance
     end
    end
  end

end
