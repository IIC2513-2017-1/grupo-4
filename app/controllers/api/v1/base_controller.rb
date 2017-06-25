class Api::V1::BaseController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :destroy_session

    def authenticate_user!
        token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
        user_email = options.blank? ? nil : options[:email]
        user = user_email && User.find_by(email: user_email)
        user_keys = UserKey.find_by(user: user)
        if user_keys && user_keys.key == token.to_s
            @current_user = user
        else
            return head :unauthorized
        end
    end

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def not_found
        head :not_found
    end

    rescue_from ActionController::ParameterMissing, with: :bad_request
    def bad_request
        head :bad_request
    end

    private

    def destroy_session
        request.session_options[:skip] = true
    end
end