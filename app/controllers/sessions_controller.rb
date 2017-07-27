class SessionsController < ApplicationController

  def homepage
  end

  def new #login
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
