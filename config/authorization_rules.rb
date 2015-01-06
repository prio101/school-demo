authorization do
  role :admin do
    has_permission_on :students, :to => [:manage, :import] do
      if_attribute :school_id => is {ActsAsTenant.current_tenant.id}
    end
    has_permission_on :students, :to => [:manage, :assign_subjects] do
      if_attribute :school_id => is {ActsAsTenant.current_tenant.id}
    end
    has_permission_on :batches, :to => :manage do
      if_attribute :school_id => is {ActsAsTenant.current_tenant.id}
    end
    has_permission_on :courses, :to => :manage do
      if_attribute :school_id => is {ActsAsTenant.current_tenant.id}
    end
    has_permission_on :fees, :to => :manage do
      if_attribute :school_id => is {ActsAsTenant.current_tenant.id}
    end
    has_permission_on :student_balances, :to => :manage do
      if_attribute :school_id => is {ActsAsTenant.current_tenant.id}
    end
    has_permission_on :fee_categories, :to => :manage do
      if_attribute :school_id => is {ActsAsTenant.current_tenant.id}
    end
    has_permission_on :collection_schedules, :to => :manage do
      if_attribute :school_id => is {ActsAsTenant.current_tenant.id}
      end
    has_permission_on :subjects, :to => :manage do
      if_attribute :school_id => is {ActsAsTenant.current_tenant.id}
    end
  end

  role :student do
    has_permission_on :students, to: [:edit, :update, :show] do
      if_attribute :user => {:student_id => is { user.student.id }}
    end
    has_permission_on :invoices, :to => [:read, :dashboard] do
      if_attribute :students => is { user.student }
    end
    has_permission_on :balances, :to => [:read, :dashboard] do
      if_attribute :students => is { user.student }
    end
  end

end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete, :dashboard, :defaulters]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => [:new]
  privilege :update, :includes => [:edit, :update]
  privilege :delete, :includes => :destroy
  privilege :dashboard, :includes => :dashboard
  privilege :defaulters, :includes => [:defaulters]
end
