class UserMailer < ApplicationMailer
    default from: "no-reply@iic2513-grupo-4.herokuapp.com"

    def signup_email(user)
        @user = user
        mail to: user.email, subject: "Nueva cuenta en iCopete"
    end
end
