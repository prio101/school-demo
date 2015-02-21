# == Route Map (Updated 2015-02-21 19:01)
#
#                             Prefix Verb       URI Pattern                                               Controller#Action
#                     exam_schedules GET        /exam_schedules(.:format)                                 exam_schedules#index
#                                    POST       /exam_schedules(.:format)                                 exam_schedules#create
#                  new_exam_schedule GET        /exam_schedules/new(.:format)                             exam_schedules#new
#                 edit_exam_schedule GET        /exam_schedules/:id/edit(.:format)                        exam_schedules#edit
#                      exam_schedule GET        /exam_schedules/:id(.:format)                             exam_schedules#show
#                                    PATCH      /exam_schedules/:id(.:format)                             exam_schedules#update
#                                    PUT        /exam_schedules/:id(.:format)                             exam_schedules#update
#                                    DELETE     /exam_schedules/:id(.:format)                             exam_schedules#destroy
#                              exams GET        /exams(.:format)                                          exams#index
#                                    POST       /exams(.:format)                                          exams#create
#                           new_exam GET        /exams/new(.:format)                                      exams#new
#                          edit_exam GET        /exams/:id/edit(.:format)                                 exams#edit
#                               exam GET        /exams/:id(.:format)                                      exams#show
#                                    PATCH      /exams/:id(.:format)                                      exams#update
#                                    PUT        /exams/:id(.:format)                                      exams#update
#                                    DELETE     /exams/:id(.:format)                                      exams#destroy
#                        exam_groups GET        /exam_groups(.:format)                                    exam_groups#index
#                                    POST       /exam_groups(.:format)                                    exam_groups#create
#                     new_exam_group GET        /exam_groups/new(.:format)                                exam_groups#new
#                    edit_exam_group GET        /exam_groups/:id/edit(.:format)                           exam_groups#edit
#                         exam_group GET        /exam_groups/:id(.:format)                                exam_groups#show
#                                    PATCH      /exam_groups/:id(.:format)                                exam_groups#update
#                                    PUT        /exam_groups/:id(.:format)                                exam_groups#update
#                                    DELETE     /exam_groups/:id(.:format)                                exam_groups#destroy
#                        attendances GET        /attendances(.:format)                                    attendances#index
#                                    POST       /attendances(.:format)                                    attendances#create
#                     new_attendance GET        /attendances/new(.:format)                                attendances#new
#                    edit_attendance GET        /attendances/:id/edit(.:format)                           attendances#edit
#                         attendance GET        /attendances/:id(.:format)                                attendances#show
#                                    PATCH      /attendances/:id(.:format)                                attendances#update
#                                    PUT        /attendances/:id(.:format)                                attendances#update
#                                    DELETE     /attendances/:id(.:format)                                attendances#destroy
#                              cards GET        /cards(.:format)                                          cards#index
#                                    POST       /cards(.:format)                                          cards#create
#                           new_card GET        /cards/new(.:format)                                      cards#new
#                          edit_card GET        /cards/:id/edit(.:format)                                 cards#edit
#                               card GET        /cards/:id(.:format)                                      cards#show
#                                    PATCH      /cards/:id(.:format)                                      cards#update
#                                    PUT        /cards/:id(.:format)                                      cards#update
#                                    DELETE     /cards/:id(.:format)                                      cards#destroy
#                government_salaries GET        /government_salaries(.:format)                            government_salaries#index
#                                    POST       /government_salaries(.:format)                            government_salaries#create
#              new_government_salary GET        /government_salaries/new(.:format)                        government_salaries#new
#             edit_government_salary GET        /government_salaries/:id/edit(.:format)                   government_salaries#edit
#                  government_salary GET        /government_salaries/:id(.:format)                        government_salaries#show
#                                    PATCH      /government_salaries/:id(.:format)                        government_salaries#update
#                                    PUT        /government_salaries/:id(.:format)                        government_salaries#update
#                                    DELETE     /government_salaries/:id(.:format)                        government_salaries#destroy
#                           teachers GET        /teachers(.:format)                                       teachers#index
#                                    POST       /teachers(.:format)                                       teachers#create
#                        new_teacher GET        /teachers/new(.:format)                                   teachers#new
#                       edit_teacher GET        /teachers/:id/edit(.:format)                              teachers#edit
#                            teacher GET        /teachers/:id(.:format)                                   teachers#show
#                                    PATCH      /teachers/:id(.:format)                                   teachers#update
#                                    PUT        /teachers/:id(.:format)                                   teachers#update
#                                    DELETE     /teachers/:id(.:format)                                   teachers#destroy
#                        departments GET        /departments(.:format)                                    departments#index
#                                    POST       /departments(.:format)                                    departments#create
#                     new_department GET        /departments/new(.:format)                                departments#new
#                    edit_department GET        /departments/:id/edit(.:format)                           departments#edit
#                         department GET        /departments/:id(.:format)                                departments#show
#                                    PATCH      /departments/:id(.:format)                                departments#update
#                                    PUT        /departments/:id(.:format)                                departments#update
#                                    DELETE     /departments/:id(.:format)                                departments#destroy
#                           subjects GET        /subjects(.:format)                                       subjects#index
#                                    POST       /subjects(.:format)                                       subjects#create
#                        new_subject GET        /subjects/new(.:format)                                   subjects#new
#                       edit_subject GET        /subjects/:id/edit(.:format)                              subjects#edit
#                            subject GET        /subjects/:id(.:format)                                   subjects#show
#                                    PATCH      /subjects/:id(.:format)                                   subjects#update
#                                    PUT        /subjects/:id(.:format)                                   subjects#update
#                                    DELETE     /subjects/:id(.:format)                                   subjects#destroy
#                   admin_home_index GET        /admin/home/index(.:format)                               admin/home#index
#              admin_view_attendance GET        /admin/view_attendance(.:format)                          admin/attendances#view_attendance
#    search_course_admin_attendances GET        /admin/attendances/search_course(.:format)                admin/attendances#search_course
#  search_students_admin_attendances GET        /admin/attendances/search_students(.:format)              admin/attendances#search_students
#                  admin_attendances GET        /admin/attendances(.:format)                              admin/attendances#index
#                                    POST       /admin/attendances(.:format)                              admin/attendances#create
#               new_admin_attendance GET        /admin/attendances/new(.:format)                          admin/attendances#new
#              edit_admin_attendance GET        /admin/attendances/:id/edit(.:format)                     admin/attendances#edit
#                   admin_attendance GET        /admin/attendances/:id(.:format)                          admin/attendances#show
#                                    PATCH      /admin/attendances/:id(.:format)                          admin/attendances#update
#                                    PUT        /admin/attendances/:id(.:format)                          admin/attendances#update
#                                    DELETE     /admin/attendances/:id(.:format)                          admin/attendances#destroy
#                 defaulter_settings GET        /defaulter_settings(.:format)                             defaulter_settings#index
#                                    POST       /defaulter_settings(.:format)                             defaulter_settings#create
#              new_defaulter_setting GET        /defaulter_settings/new(.:format)                         defaulter_settings#new
#             edit_defaulter_setting GET        /defaulter_settings/:id/edit(.:format)                    defaulter_settings#edit
#                  defaulter_setting GET        /defaulter_settings/:id(.:format)                         defaulter_settings#show
#                                    PATCH      /defaulter_settings/:id(.:format)                         defaulter_settings#update
#                                    PUT        /defaulter_settings/:id(.:format)                         defaulter_settings#update
#                                    DELETE     /defaulter_settings/:id(.:format)                         defaulter_settings#destroy
#         student_defaulter_settings GET        /student_defaulter_settings(.:format)                     student_defaulter_settings#index
#                                    POST       /student_defaulter_settings(.:format)                     student_defaulter_settings#create
#      new_student_defaulter_setting GET        /student_defaulter_settings/new(.:format)                 student_defaulter_settings#new
#     edit_student_defaulter_setting GET        /student_defaulter_settings/:id/edit(.:format)            student_defaulter_settings#edit
#          student_defaulter_setting GET        /student_defaulter_settings/:id(.:format)                 student_defaulter_settings#show
#                                    PATCH      /student_defaulter_settings/:id(.:format)                 student_defaulter_settings#update
#                                    PUT        /student_defaulter_settings/:id(.:format)                 student_defaulter_settings#update
#                                    DELETE     /student_defaulter_settings/:id(.:format)                 student_defaulter_settings#destroy
#                               root GET        /                                                         homepage#index
#                                tag GET        /tag(.:format)                                            homepage#tag
#                          main_home GET        /main/home(.:format)                                      main#home
#                               attn GET        /attn(.:format)                                           main#attendances
#                             l_attn GET        /l_attn(.:format)                                         main#last_attns
#   main_student_balance_information GET        /main/student_balance_information(.:format)               main#student_balance_information
#                   new_user_session GET        /users/sign_in(.:format)                                  devise/sessions#new
#                       user_session POST       /users/sign_in(.:format)                                  devise/sessions#create
#               destroy_user_session DELETE     /users/sign_out(.:format)                                 devise/sessions#destroy
#                      user_password POST       /users/password(.:format)                                 devise/passwords#create
#                  new_user_password GET        /users/password/new(.:format)                             devise/passwords#new
#                 edit_user_password GET        /users/password/edit(.:format)                            devise/passwords#edit
#                                    PATCH      /users/password(.:format)                                 devise/passwords#update
#                                    PUT        /users/password(.:format)                                 devise/passwords#update
#           cancel_user_registration GET        /users/cancel(.:format)                                   devise/registrations#cancel
#                  user_registration POST       /users(.:format)                                          devise/registrations#create
#              new_user_registration GET        /users/sign_up(.:format)                                  devise/registrations#new
#             edit_user_registration GET        /users/edit(.:format)                                     devise/registrations#edit
#                                    PATCH      /users(.:format)                                          devise/registrations#update
#                                    PUT        /users(.:format)                                          devise/registrations#update
#                                    DELETE     /users(.:format)                                          devise/registrations#destroy
#                         admin_root GET        /admin(.:format)                                          admin/dashboard#index
#                  admin_admin_users GET        /admin/admin_users(.:format)                              admin/admin_users#index
#                                    POST       /admin/admin_users(.:format)                              admin/admin_users#create
#               new_admin_admin_user GET        /admin/admin_users/new(.:format)                          admin/admin_users#new
#              edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                     admin/admin_users#edit
#                   admin_admin_user GET        /admin/admin_users/:id(.:format)                          admin/admin_users#show
#                                    PATCH      /admin/admin_users/:id(.:format)                          admin/admin_users#update
#                                    PUT        /admin/admin_users/:id(.:format)                          admin/admin_users#update
#                                    DELETE     /admin/admin_users/:id(.:format)                          admin/admin_users#destroy
#               admin_fee_categories GET        /admin/fee_categories(.:format)                           admin/fee_categories#index
#                                    POST       /admin/fee_categories(.:format)                           admin/fee_categories#create
#             new_admin_fee_category GET        /admin/fee_categories/new(.:format)                       admin/fee_categories#new
#            edit_admin_fee_category GET        /admin/fee_categories/:id/edit(.:format)                  admin/fee_categories#edit
#                 admin_fee_category GET        /admin/fee_categories/:id(.:format)                       admin/fee_categories#show
#                                    PATCH      /admin/fee_categories/:id(.:format)                       admin/fee_categories#update
#                                    PUT        /admin/fee_categories/:id(.:format)                       admin/fee_categories#update
#                                    DELETE     /admin/fee_categories/:id(.:format)                       admin/fee_categories#destroy
#     school_migration_admin_student PUT        /admin/students/:id/school_migration(.:format)            admin/students#school_migration
#                     admin_students GET        /admin/students(.:format)                                 admin/students#index
#                                    POST       /admin/students(.:format)                                 admin/students#create
#                  new_admin_student GET        /admin/students/new(.:format)                             admin/students#new
#                 edit_admin_student GET        /admin/students/:id/edit(.:format)                        admin/students#edit
#                      admin_student GET        /admin/students/:id(.:format)                             admin/students#show
#                                    PATCH      /admin/students/:id(.:format)                             admin/students#update
#                                    PUT        /admin/students/:id(.:format)                             admin/students#update
#                                    DELETE     /admin/students/:id(.:format)                             admin/students#destroy
#                      admin_clients GET        /admin/clients(.:format)                                  admin/clients#index
#                                    POST       /admin/clients(.:format)                                  admin/clients#create
#                   new_admin_client GET        /admin/clients/new(.:format)                              admin/clients#new
#                  edit_admin_client GET        /admin/clients/:id/edit(.:format)                         admin/clients#edit
#                       admin_client GET        /admin/clients/:id(.:format)                              admin/clients#show
#                                    PATCH      /admin/clients/:id(.:format)                              admin/clients#update
#                                    PUT        /admin/clients/:id(.:format)                              admin/clients#update
#                                    DELETE     /admin/clients/:id(.:format)                              admin/clients#destroy
#              students_admin_school GET        /admin/schools/:id/students(.:format)                     admin/schools#students
#                      admin_schools GET        /admin/schools(.:format)                                  admin/schools#index
#                                    POST       /admin/schools(.:format)                                  admin/schools#create
#                   new_admin_school GET        /admin/schools/new(.:format)                              admin/schools#new
#                  edit_admin_school GET        /admin/schools/:id/edit(.:format)                         admin/schools#edit
#                       admin_school GET        /admin/schools/:id(.:format)                              admin/schools#show
#                                    PATCH      /admin/schools/:id(.:format)                              admin/schools#update
#                                    PUT        /admin/schools/:id(.:format)                              admin/schools#update
#                                    DELETE     /admin/schools/:id(.:format)                              admin/schools#destroy
#                    admin_dashboard GET        /admin/dashboard(.:format)                                admin/dashboard#index
#             new_admin_user_session GET        /login(.:format)                                          active_admin/devise/sessions#new
#                 admin_user_session POST       /login(.:format)                                          active_admin/devise/sessions#create
#         destroy_admin_user_session DELETE|GET /logout(.:format)                                         active_admin/devise/sessions#destroy
#                admin_user_password POST       /password(.:format)                                       active_admin/devise/passwords#create
#            new_admin_user_password GET        /password/new(.:format)                                   active_admin/devise/passwords#new
#           edit_admin_user_password GET        /password/edit(.:format)                                  active_admin/devise/passwords#edit
#                                    PATCH      /password(.:format)                                       active_admin/devise/passwords#update
#                                    PUT        /password(.:format)                                       active_admin/devise/passwords#update
#                    course_sections GET        /class_sections(.:format)                                 course_sections#index
#                                    POST       /class_sections(.:format)                                 course_sections#create
#                 new_course_section GET        /class_sections/new(.:format)                             course_sections#new
#                edit_course_section GET        /class_sections/:id/edit(.:format)                        course_sections#edit
#                     course_section GET        /class_sections/:id(.:format)                             course_sections#show
#                                    PATCH      /class_sections/:id(.:format)                             course_sections#update
#                                    PUT        /class_sections/:id(.:format)                             course_sections#update
#                                    DELETE     /class_sections/:id(.:format)                             course_sections#destroy
#                              users GET        /users(.:format)                                          users#index
#                                    POST       /users(.:format)                                          users#create
#                           new_user GET        /users/new(.:format)                                      users#new
#                          edit_user GET        /users/:id/edit(.:format)                                 users#edit
#                               user GET        /users/:id(.:format)                                      users#show
#                                    PATCH      /users/:id(.:format)                                      users#update
#                                    PUT        /users/:id(.:format)                                      users#update
#                                    DELETE     /users/:id(.:format)                                      users#destroy
#               collection_schedules GET        /fee_collections(.:format)                                collection_schedules#index
#                                    POST       /fee_collections(.:format)                                collection_schedules#create
#            new_collection_schedule GET        /fee_collections/new(.:format)                            collection_schedules#new
#           edit_collection_schedule GET        /fee_collections/:id/edit(.:format)                       collection_schedules#edit
#                collection_schedule GET        /fee_collections/:id(.:format)                            collection_schedules#show
#                                    PATCH      /fee_collections/:id(.:format)                            collection_schedules#update
#                                    PUT        /fee_collections/:id(.:format)                            collection_schedules#update
#                                    DELETE     /fee_collections/:id(.:format)                            collection_schedules#destroy
#                           invoices GET        /invoices(.:format)                                       invoices#index
#                                    POST       /invoices(.:format)                                       invoices#create
#                        new_invoice GET        /invoices/new(.:format)                                   invoices#new
#                       edit_invoice GET        /invoices/:id/edit(.:format)                              invoices#edit
#                            invoice GET        /invoices/:id(.:format)                                   invoices#show
#                                    PATCH      /invoices/:id(.:format)                                   invoices#update
#                                    PUT        /invoices/:id(.:format)                                   invoices#update
#                                    DELETE     /invoices/:id(.:format)                                   invoices#destroy
#                     fee_categories GET        /school_fees(.:format)                                    fee_categories#index
#                                    POST       /school_fees(.:format)                                    fee_categories#create
#                   new_fee_category GET        /school_fees/new(.:format)                                fee_categories#new
#                  edit_fee_category GET        /school_fees/:id/edit(.:format)                           fee_categories#edit
#                       fee_category GET        /school_fees/:id(.:format)                                fee_categories#show
#                                    PATCH      /school_fees/:id(.:format)                                fee_categories#update
#                                    PUT        /school_fees/:id(.:format)                                fee_categories#update
#                                    DELETE     /school_fees/:id(.:format)                                fee_categories#destroy
#                    import_students POST       /students/import(.:format)                                students#import
#                                    GET        /students/import(.:format)                                students#import
#            assign_subjects_student GET        /students/:id/assign_subjects(.:format)                   students#assign_subjects
#                    student_results GET        /students/:student_id/results(.:format)                   results#index
#                                    POST       /students/:student_id/results(.:format)                   results#create
#                 new_student_result GET        /students/:student_id/results/new(.:format)               results#new
#                edit_student_result GET        /students/:student_id/results/:id/edit(.:format)          results#edit
#                     student_result GET        /students/:student_id/results/:id(.:format)               results#show
#                                    PATCH      /students/:student_id/results/:id(.:format)               results#update
#                                    PUT        /students/:student_id/results/:id(.:format)               results#update
#                                    DELETE     /students/:student_id/results/:id(.:format)               results#destroy
#           student_student_balances GET        /students/:student_id/student_balances(.:format)          student_balances#index
#                                    POST       /students/:student_id/student_balances(.:format)          student_balances#create
#        new_student_student_balance GET        /students/:student_id/student_balances/new(.:format)      student_balances#new
#       edit_student_student_balance GET        /students/:student_id/student_balances/:id/edit(.:format) student_balances#edit
#            student_student_balance GET        /students/:student_id/student_balances/:id(.:format)      student_balances#show
#                                    PATCH      /students/:student_id/student_balances/:id(.:format)      student_balances#update
#                                    PUT        /students/:student_id/student_balances/:id(.:format)      student_balances#update
#                                    DELETE     /students/:student_id/student_balances/:id(.:format)      student_balances#destroy
#                    student_parents GET        /students/:student_id/parents(.:format)                   parents#index
#                                    POST       /students/:student_id/parents(.:format)                   parents#create
#                 new_student_parent GET        /students/:student_id/parents/new(.:format)               parents#new
#                edit_student_parent GET        /students/:student_id/parents/:id/edit(.:format)          parents#edit
#                     student_parent GET        /students/:student_id/parents/:id(.:format)               parents#show
#                                    PATCH      /students/:student_id/parents/:id(.:format)               parents#update
#                                    PUT        /students/:student_id/parents/:id(.:format)               parents#update
#                                    DELETE     /students/:student_id/parents/:id(.:format)               parents#destroy
#                 dashboard_students GET        /students/dashboard(.:format)                             students#dashboard
#                defaulters_students GET        /students/defaulters(.:format)                            students#defaulters
#                           students GET        /students(.:format)                                       students#index
#                                    POST       /students(.:format)                                       students#create
#                        new_student GET        /students/new(.:format)                                   students#new
#                       edit_student GET        /students/:id/edit(.:format)                              students#edit
#                            student GET        /students/:id(.:format)                                   students#show
#                                    PATCH      /students/:id(.:format)                                   students#update
#                                    PUT        /students/:id(.:format)                                   students#update
#                                    DELETE     /students/:id(.:format)                                   students#destroy
#                  dashboard_courses GET        /classes/dashboard(.:format)                              courses#dashboard
#                            courses GET        /classes(.:format)                                        courses#index
#                                    POST       /classes(.:format)                                        courses#create
#                         new_course GET        /classes/new(.:format)                                    courses#new
#                        edit_course GET        /classes/:id/edit(.:format)                               courses#edit
#                             course GET        /classes/:id(.:format)                                    courses#show
#                                    PATCH      /classes/:id(.:format)                                    courses#update
#                                    PUT        /classes/:id(.:format)                                    courses#update
#                                    DELETE     /classes/:id(.:format)                                    courses#destroy
#                     dashboard_fees GET        /fees/dashboard(.:format)                                 fees#dashboard
#                               fees GET        /fees(.:format)                                           fees#index
#                                    POST       /fees(.:format)                                           fees#create
#                            new_fee GET        /fees/new(.:format)                                       fees#new
#                           edit_fee GET        /fees/:id/edit(.:format)                                  fees#edit
#                                fee GET        /fees/:id(.:format)                                       fees#show
#                                    PATCH      /fees/:id(.:format)                                       fees#update
#                                    PUT        /fees/:id(.:format)                                       fees#update
#                                    DELETE     /fees/:id(.:format)                                       fees#destroy
#                  dashboard_batches GET        /school_years/dashboard(.:format)                         batches#dashboard
#            dashboard_batch_courses GET        /school_years/:batch_id/classes/dashboard(.:format)       courses#dashboard
#                      batch_courses GET        /school_years/:batch_id/classes(.:format)                 courses#index
#                                    POST       /school_years/:batch_id/classes(.:format)                 courses#create
#                   new_batch_course GET        /school_years/:batch_id/classes/new(.:format)             courses#new
#                  edit_batch_course GET        /school_years/:batch_id/classes/:id/edit(.:format)        courses#edit
#                       batch_course GET        /school_years/:batch_id/classes/:id(.:format)             courses#show
#                                    PATCH      /school_years/:batch_id/classes/:id(.:format)             courses#update
#                                    PUT        /school_years/:batch_id/classes/:id(.:format)             courses#update
#                                    DELETE     /school_years/:batch_id/classes/:id(.:format)             courses#destroy
#           dashboard_batch_students GET        /school_years/:batch_id/students/dashboard(.:format)      students#dashboard
#                     batch_students GET        /school_years/:batch_id/students(.:format)                students#index
#                                    POST       /school_years/:batch_id/students(.:format)                students#create
#                  new_batch_student GET        /school_years/:batch_id/students/new(.:format)            students#new
#                 edit_batch_student GET        /school_years/:batch_id/students/:id/edit(.:format)       students#edit
#                      batch_student GET        /school_years/:batch_id/students/:id(.:format)            students#show
#                                    PATCH      /school_years/:batch_id/students/:id(.:format)            students#update
#                                    PUT        /school_years/:batch_id/students/:id(.:format)            students#update
#                                    DELETE     /school_years/:batch_id/students/:id(.:format)            students#destroy
#                            batches GET        /school_years(.:format)                                   batches#index
#                                    POST       /school_years(.:format)                                   batches#create
#                          new_batch GET        /school_years/new(.:format)                               batches#new
#                         edit_batch GET        /school_years/:id/edit(.:format)                          batches#edit
#                              batch GET        /school_years/:id(.:format)                               batches#show
#                                    PATCH      /school_years/:id(.:format)                               batches#update
#                                    PUT        /school_years/:id(.:format)                               batches#update
#                                    DELETE     /school_years/:id(.:format)                               batches#destroy
#                ajax_select_section GET        /ajax/select_section(.:format)                            ajax#select_section
#                 ajax_select_course GET        /ajax/select_course(.:format)                             ajax#select_course
#                 api_v1_access_code GET        /api/v1/access_code(.:format)                             api/v1/access_request#access_code
#                     api_v1_balance GET        /api/v1/balance(.:format)                                 api/v1/students#balance
#                                    POST       /api/v1/balance(.:format)                                 api/v1/students#add_balance
#          graph_authorization_rules GET        /authorization_rules/graph(.:format)                      authorization_rules#graph
#         change_authorization_rules GET        /authorization_rules/change(.:format)                     authorization_rules#change
# suggest_change_authorization_rules GET        /authorization_rules/suggest_change(.:format)             authorization_rules#suggest_change
#                authorization_rules GET        /authorization_rules(.:format)                            authorization_rules#index
#               authorization_usages GET        /authorization_usages(.:format)                           authorization_usages#index
#

SchoolWings::Application.routes.draw do



  resources :exam_schedules

  resources :exams

  resources :exam_groups

  # get 'manual_attendance' => 'attendances#manual_attendance'
  # post 'create_mass_attendance' => 'attendances#create_mass_attendance'
  # match 'attendances', to: 'attendances#create', via: [:options]
  resources :attendances


  resources :cards

  resources :government_salaries

  resources :teachers

  resources :departments

  resources :subjects

  namespace :admin do
    get "home/index"
    get "view_attendance" => "attendances#view_attendance"
    resources :attendances do
      get :search_course, on: :collection
      get :search_students, on: :collection
    end
  end

  resources :defaulter_settings
  resources :student_defaulter_settings

  root "homepage#index"
  get '/tag' => 'homepage#tag'
  get 'main/home' => "main#home"
  get '/attn' => "main#attendances"
  get '/l_attn' => "main#last_attns"
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
