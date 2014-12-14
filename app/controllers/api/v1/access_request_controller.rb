module Api
  module V1
    class AccessRequestController < Api::V1::ApiController

      skip_before_filter :restrict_access

      def access_code
        head :unauthorized unless params[:client_key]
        @client = Client.find_by(client_key: params[:client_key])
        if @client
          if @client.api_keys.count > 0
            render json:{access_token:  @client.api_keys.first.access_token}, status: 200
          elsif @client.api_keys.count < 1
            @api_key = @client.api_keys.create
            render json: @api_key.access_token, status: 200
          end
        else
          head :unauthorized
        end
      end
    end
  end
end
