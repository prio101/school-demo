class ApplicationController < ActionController::Base

  set_current_tenant_through_filter


  protect_from_forgery with: :exception

  before_filter :set_locale

  before_filter :set_school
  before_filter :disable_authorization_for_super_admins
  before_filter :set_current_user

  add_breadcrumb "home", :root_path

  helper_method :current_domain, :set_school, :current_school, :current_user_required

  rescue_from ActsAsTenant::Errors::NoTenantSet do
    flash.now[:error] = "No school available!"
     render_page_not_found
  end


  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def admin_zone?
    self.class.parent == Admin
  end

  def authenticate_with_admin
    authenticate_user! unless admin_zone?
  end

  def current_domain
    "#{request.scheme}://#{request.host}"
  end

  def set_school
    # current_school = School.find_by(domain: current_domain)
    current_school = School.first
    set_current_tenant(current_school)
  end

  def render_page_not_found
    render :file => 'public/no_school.html', :status => :not_found, :layout => false
  end

  def current_school
    current_tenant
  end



  protected

  def disable_authorization_for_super_admins
    if admin_zone?
      Authorization.ignore_access_control(true)
    else
      Authorization.ignore_access_control(false)
    end
  end

  def set_current_user
    set_school
    if current_user
      Authorization.current_user = current_user
    end
  end


  def not_authenticated
    redirect_to login_url, :alert => "First login to access this page."
  end




end
