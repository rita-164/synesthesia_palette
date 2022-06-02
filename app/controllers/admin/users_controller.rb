class Admin::UsersController < Admin::BaseController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :check_admin, only: %i[new edit update]
  
    def index
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true).order(created_at: :desc)
    end
  
    def show; end
  
    def new
      @user = User.new
    end
  
    def edit; end
  

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to admin_user_path, success: t('.success')
        else
          flash.now[:danger] = t('.fail')
          render :edit
        end
      end

    def destroy
        @user = User.find(params[:id])
        @user.destroy!
        redirect_to admin_users_path, success: t('.success')
      end
  
    private

      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(:email, :last_name, :first_name, :avatar, :role)
      end
end
