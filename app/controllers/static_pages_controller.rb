class StaticPagesController < ApplicationController
  def home
    if signed_in?
      redirect_to current_user 
    else
      render :layout => "home_layout"
    end
  end

  def help
  end

  def about
  end
end
