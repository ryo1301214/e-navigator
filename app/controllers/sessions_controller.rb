class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      flash[:notice] = 'ログインしました'
      redirect_to user
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
end
