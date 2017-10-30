class UsersController < ApplicationController

  def new                 #this presents a form to the user to create a new user (SIGNUP)
    render :new
  end

  def create            #this creates the user in the database given the user params if they are valid
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)         #login the user (see application controller methods) because they just signed up.
      redirect_to user_url       #redirects to the user page once the new user has been created
    else
      flash.now[:errors] = "Invalid Login, dog"     #This sends error to the user if they're user params were not valid
      render :new                                   #This renders the new user sign up page (view)
    end
  end

  def show
    render :show          #This renders the user's show page (This will be the home/user page that the user sees once logged in)
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
