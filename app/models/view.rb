class View < ActiveRecord::Base
  
  HIDDEN = "hidden"
  SEEN = "seen"
  
  def self.hide(user, film_id)
    self.new_from_user(user, film_id, HIDDEN)
  end
  
  def self.seen(user, film_id)
    self.new_from_user(user, film_id, SEEN)
  end
  
  def self.new_from_user(user, film_id, status)
    if user && Util.ne(film_id)
      view = self.new    
      view.user = user
      view.film_id = film_id
      view.status = status
      view.save()
    end
  end
end