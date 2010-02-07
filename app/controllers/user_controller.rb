class UserController < ApplicationController

  def index
    if logged_in?
      redirect_to("/")
    else
      redirect_to(:controller => 'user', :action => 'login')
    end
  end

  def login
    if request.post? # make some suggestions
      # set up user
      @user = User.find_by_username(params[:username])
      if !@user
        @user = User.new_from_request(params[:username])
        @user.save()
      end
      
      cookies[:user_id] = @user.id.to_s
      redirect_to("/")
    else
      # just show user selection form and latest users
    end
  end
end