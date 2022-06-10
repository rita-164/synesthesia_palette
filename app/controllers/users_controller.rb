class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
      end
    
    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to login_path, dark: t('.success')
        else
          flash.now[:dark] = t('.fail')
          render :new
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
