class RegisterController < ApplicationController
    skip_before_action :authenticate_request
    
    # POST /register
    def createNewUser        
        @user = User.new(user_params)
        puts @user
        if (@user.valid?)
            @user.save
            render json: { error: "User has been created with Id: #{@user.id}"}, status: :ok
              
        else
            render json: { error: "Error: #{@user.errors.messages}"}, status: :ok        
        end
    end
    
    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end