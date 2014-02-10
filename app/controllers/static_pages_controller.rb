class StaticPagesController < ApplicationController
  def home
    if signed_in?
      redirect_to :controller => 'users', :action => 'feed', :id => current_user.id
    else
      render :layout => "home_layout"
    end
  end

  def help
  end

  def about
  end
end
