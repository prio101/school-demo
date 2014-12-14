ActiveAdmin.register Student do

  controller do
    def scoped_collection
      Student.unscoped
    end

    before_filter do
      Authorization.ignore_access_control(true)
      ActsAsTenant.configure do |config|
        config.require_tenant = false # true
      end
    end

  end

  permit_params Student.attribute_names

  index do
    column :name do |student|
      student.name
    end


    column "email" do |student|
      student.try(:email)
    end

    column :password do |student|
      "student_#{student.id}#{123}"
    end


    column :school do |student|
      student.school.name
    end

    column :admission_number do |student|
      student.admission_number
    end

    column :amount_payable do |student|
      student.amount_payable
    end

    column :current_balance do |student|
      student.balance
    end

    actions
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :batch
      f.input :course, as: :select, collection: f.object.school.courses
      f.input :course_section
    end
    f.actions
  end

  show do |student|
    attributes_table do
      row :name do
        student.name
      end

      row :email do
        student.email
      end

      row :password do
        "student_#{student.id}#{123}"
      end

      row :admission_number do
        student.admission_number
      end

      row :payable_amount do
        student.amount_payable
      end

      row :current_balance do
        student.balance
      end

      row :name do
        student.school.name
      end

      row :school_migration do
        render 'school_migration_form', student: student
      end
    end
  end

  member_action :school_migration, :method => :put do
    user = Student.unscoped.find(params[:id])
    redirect_to admin_student_path(user), {:notice => School.student_migration(params[:id], params[:school_id])}
  end

end
