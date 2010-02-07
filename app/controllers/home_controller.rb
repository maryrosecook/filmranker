class HomeController < ApplicationController

  def index
    if Util.ne(cookies[:user_id])
    else
      cookies[:user_id] = User._new_and_save().id.to_s
    end
    
    @films = Film.top_rated()
  end
  
  def scrape
    if logged_in?
      Scraping.scrape()
      flash[:notice] = "Scraped latest films."
      redirect_to "/"
    else
      flash[:notice] = "Not logged in."
      redirect_to "/"
    end
  end
  
  def about
    
  end
end