class HomepagesController < ApplicationController


  def index
    get_current_user


  end

  private
    def get_current_user
        @user = User.find_by(id: session[:user_id] )
    end

end
