class Film < ActiveRecord::Base
  
  METACRITIC_BASE_URL = "http://www.metacritic.com"
  
  MIN_SCORE = 60
  
  def self.top_rated
    self.find(:all).find_all { |x| x.score.to_i >= MIN_SCORE }.sort { |x,y| y.score.to_i <=> x.score.to_i }
  end
  
  def self.get_or_create(name, url, score)
    film = find_for_name(name)
    if !film
      film = self.new
      film.name = name
    end
    
    film.url = url
    film.score = score
    return film
  end
  
  def get_url
    METACRITIC_BASE_URL + self.url
  end
  
  def self.find_for_name(name)
    self.find(:first, :conditions =>  "name = '#{Util.esc_apos(name)}'")
  end
end