class Api::V1::AuthenticationController < ApplicationController
    # skip_before_action :authenticate_request
   
    def authenticate
        command = AuthenticateUser.call(params[:email], params[:password])
    
        if command.success?
            render json: { auth_token: command.result }
        else
            render json: { error: command.errors }, status: :unauthorized
        end
    end

    def persist
        if request.headers['Authorization']
            encoded_token = request.headers['Authorization'].split(' ')[1]
            token = JsonWebToken.decode(encoded_token, secret)
            user_id = token[0]['user_id']
            user = User.find(user_id)
            render json: user
        end
    end

    private

    def login_params
        params.permit(:email, :password)
    end
end