class User < ActiveRecord::Base
  has_many :views
  
  def self._new_and_save()
    user = self.new()
    user.save()
    user.username = user.id
    user.save
    return user
  end
end