class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(params.require(:user).permit(:name))
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @user = User.new
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "Come back soon!"
  end
end
