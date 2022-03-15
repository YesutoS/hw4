class SessionsController < ApplicationController
  def new

  end

  def create
    # find the user trying to login
    @user = User.where({ email: params["email"]})[0]
    #if the user exists and the password matches, send them along, otherwise send them to login again
    if @user #if the user exists
      if BCrypt::Password.new(@user.password) == params["password"] #check if the password they entered in params matches what we have in our table
        session["user_id"] = @user.id
        flash[:notice] = "You logged in!"
        redirect_to "/" 
      else
        flash[:notice] = "Your password was incorrect. Please try again."
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "No user exists with that email address. Please try again."
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session["user_id"] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to "/sessions/new"
  end
end
  