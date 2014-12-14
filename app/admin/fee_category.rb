ActiveAdmin.register FeeCategory do
  permit_params FeeCategory.attribute_names

  form do |f|
    f.inputs "Category" do
      f.input :name
      f.input :school_id, as: :select, collection: School.all
    end

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


