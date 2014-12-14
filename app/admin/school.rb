ActiveAdmin.register School do


  permit_params :name, :details, :banner, :logo, :active, :code, :domain

  index do
    column :name
    column :domain
    column :admin_user do |school|
      school.users.try(:admin).try(:first).try(:email)
    end
    actions
  end

  member_action :students, :method => :get do
    @school = School.find(params[:id])
      @students = @school.students.unscoped
    @students
  end

  controller do
    before_filter do
      Authorization.ignore_access_control(true)
      ActsAsTenant.configure do |config|
        config.require_tenant = false # true
      end
    end
  end

end


