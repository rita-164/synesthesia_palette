class UserSessionsController < ApplicationController

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path, dark: t('.success')
    else
      flash.now[:dark] = t('.fail')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, dark: t('.success')
  end
end
