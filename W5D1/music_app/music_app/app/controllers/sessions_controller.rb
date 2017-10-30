class SessionsController < ApplicationController

  def new                       #This gives the SIGN IN form(view) to the user if they are not logged in
    if logged_in?
      redirect_to user_url     #redirects them to the user home page if they are already logged in
    else
      render :new
    end           #renders the sign in page
  end

  def create                  #creates a new session
    @user = User.find_by_credentials(session_params)      #checks that the user's credentials are legit
    if @user                         #this won't exist if the credentials weren't good
      log_in_user!(@user)           #resets the current user's session token and resets the session cookie
      redirect_to user_url          #redirects them to the user's show page
    else                            #this is the case where the credentials were not good
      flash.now[:errors] = "Invalid Login, dog"
      render :new                   #sends them back to the sign in form/page
    end
  end

  def destroy                       #ends a session by logging out the user
    if logged_in?                   #checks that the user is in fact logged in before ending the session
      logout!
    end                      #logs out the user by reset_session_token! and setting the session cookies to nil
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
