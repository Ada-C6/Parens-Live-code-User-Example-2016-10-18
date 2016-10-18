class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    if ! auth_hash['uid']
      flash[:notice] = "Login Failed!"
      return redirect_to root_path
    end

    @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
    if @user.nil?
      # User doesn't match anything in the DB.
      # Attempt to create a new user.
      @user = User.build_from_github(auth_hash)
      flash[:notice] = "Unable to Save the User"
      return redirect_to root_path unless @user.save
    end

    # Save the user ID in the session
    session[:user_id] = @user.id

    flash[:notice] = "Successfully Logged in!"
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
  end

end
