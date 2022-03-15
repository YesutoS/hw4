class ApplicationController < ActionController::Base
  #The below line is necessary to tell rails to run the current_user method before every other action it takes
  before_action :current_user

  def current_user
    puts "------------------ code before every request ------------------"
    #Define a variable for current user
    if session[:user_id]
     @current_user = User.find(session["user_id"])
    end
  end
end
