class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        #login the user
        flash["notice"] = "You've logged in successfully."
        redirect_to "/places"
    else
      flash["notice"] = "Unsuccessful login."
      redirect_to "/sessions/new"
    end
  else
    flash["notice"] = "Unsuccessful login."
    redirect_to "/sessions/new"
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
end