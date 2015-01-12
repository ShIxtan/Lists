class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]
  before_action :require_logout, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["invalid password"]
      redirect_to new_session_url
    end
  end

  def destroy
    logout!(current_user)
    redirect_to new_session_url
  end

  def require_logout
    user = current_user
    redirect_to user_url(user) if user
  end
end
