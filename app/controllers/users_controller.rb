class UsersController < ApplicationController
  def login_form
    @user = User.new
  end

  
end
