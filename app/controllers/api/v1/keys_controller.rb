class Api::V1::KeysController < Api::V1::BaseController
    def create
        user = User.find_by(email: create_params[:email])
        if user && user.authenticate(create_params[:password])
            key = SecureRandom.base64(64)
            user_key = UserKey.new user: user, key: key
            if user_key.save
                render(json: user_key.to_json)
            else
                render :nothing => true, :status => 500
            end
        else
            render :nothing => true, :status => 401
        end
    end

    private

    def create_params
        params.require(:user).permit(:email, :password)
    end
end