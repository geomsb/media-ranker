class UsersController < ApplicationController
  def login_form
    @user = User.new
  end

  def login
    username = params[:user][:username]
    user = User.find_by(username: username)
    if username.chomp == "" || user == nil
      flash[:failure] = {general: "A problem occurred: Could not log in", username: "username: can't be blank"}
      redirect_to login_path
    else
      if user
        session[:user_id] = user.id
        flash[:success] = "Successfully logged in as returning user #{username}"
      else
        user = User.create(username: username)
        session[:user_id] = user.id
        flash[:success] = "Successfully logged in as new user #{username}"
      end
      redirect_to root_path
    end
  end

  def current
    @current_user = User.find_by(id: session[:user_id])
    unless @current_user
      flash[:error] = "You must be logged in to see this page"
      redirect_to root_path
    end
  end

  def logout
    username = params[:user][:username]
    user = User.find_by(username: username)
    if user
      session[:user_id] = nil
    else
      flash[:failure] = "Error logging out"
    end
    redirect_to root_path
  end
end
