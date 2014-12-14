class Api::V1::ApiController < ApplicationController
    skip_before_filter :set_current_user
    skip_before_filter :set_school
    skip_before_filter :verify_authenticity_token, :except => [:update, :create]

    before_filter :restrict_access

    helper_method :throw_access_denied

    respond_to :json

    private

    def restrict_access
      Authorization.ignore_access_control(true)
      ActsAsTenant.configure do |config|
        config.require_tenant = false # true
      end
      api_key = ApiKey.find_by(access_token: params[:token])
      head :unauthorized, status: 404 unless api_key
    end

  def throw_access_denied
    head :unauthorized
  end

end
