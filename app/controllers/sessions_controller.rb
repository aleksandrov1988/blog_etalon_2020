class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(login: params[:login])
    unless @user
      flash[:danger] = t('.user_not_found')
      redirect_to login_path
      return
    end
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: t('.success')
    else
      flash[:danger] = t('.invalid_password')
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: t('.success')
  end
end
